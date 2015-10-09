class ConditionController < ApplicationController
  def index
  	#Get the patient with the ID sent to this action as a parameter from the Patient table.  Store the retrieved patient in an instance variable:
  	@currentPatient = Patient.find_by_id(params[:id])
  	#Get all conditions from the Condition database that have a patient_id matching the ID sent to this action as a parameter.  Store the array of returned conditions in an instance variable:
	@conditions = Condition.where(:patient_id => params[:id]).all
	#Create some personalized header text to show at the top of the index viewe:
	@headertext = @currentPatient[:name_first] + " "+ @currentPatient[:name_last]+"'s Health Conditions"
	#Only doctors, nurses, and admins can edit an existing condtion.  Patients can only add new conditions and view the conditions they added
  @allowEdit = filter_action(["ADMIN", "NURSE", "DOCTOR"])
  #get the URL to the current user's main page:
	@main_route = main_route()

  end

  def create
  	#show_doctors_notes is only true if current user is an admin, nurse, or doctor
  	@show_doctors_notes = filter_action(["ADMIN", "NURSE", "DOCTOR"])
  end

  def create_submit#expects the ID of the patient this condition applies to as a parameter
  	#Create a new condition entry in the Condition table with the parameters entered in the create view: 
  	@condition = Condition.create(:patient_id => params[:patient_id], :condition => params[:condition], :notes => params[:notes])
	#Go back to the index view, and pass the ID of the patient whose conditions we want to see:
	redirect_to :action => 'index', :id => params[:patient_id]
  end

  def delete#expects the ID of a condition to delete as a parameter
    #only admins, nurses, doctors, or patients can delete medical conditions 
    if filter_action(["ADMIN", "NURSE", "DOCTOR", "PATIENT"])
  	   @patient_id = (Condition.find_by_id(params[:condition_id]))[:patient_id]  #get ID of patient with condition to delete
  	   Condition.destroy(params[:condition_id])#Delete condition from Condition table
    end
  	redirect_to :action => 'index', :id => @patient_id#return to patient's index of conditions
  end

  def edit#expects the ID of a condition to edit as a parameter
  	@editCondition = Condition.find_by_id(params[:condition_id])#get the condition that we are editing
  	@show_doctors_notes = filter_action(["ADMIN", "NURSE", "DOCTOR"])#only doctors, admins, and nurses can see/edit notes
  end

  def edit_submit
  	@editCondition = Condition.find_by_id(params[:condition_id])#find codition by id from edit action
  	@patient_id = @editCondition[:patient_id]#get the id of the patient with the editted condition
  	@editCondition.update_attributes(:patient_id => @patient_id, :condition => params[:condition], :notes => params[:notes])
  	redirect_to :action => 'index', :id => @patient_id#return to patient's index of conditions
  end
end
