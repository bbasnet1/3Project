class AppointmentController < ApplicationController
  def index
  	#Get all appointments for the patient with the ID passed as a parameter:
    @currentPatient = Patient.find_by_id(params[:id])
	 @appointments = Appointment.where(:patient_id => params[:id]]).all
	 @headertext = @currentPatient[:name_first] + " "+ @currentPatient[:name_last]+"'s Appointments"
	 @valid = filter_action(["ADMIN"])#only admins can add/edit/delete appointments from the index view (Patients create new appointments from the main view)
  end
  
  def create
	
  end

  def create_submit
  p "CREATE_SUBMIT"
  # Datetime form data is in a strange format, causing errors here
  p params[:datetime]
  	@appointment = Appointment.create(:patient_id => params[:patient_id], :doctor_id => params[:doctor_id], :date_time => params[:datetime])
	 redirect_to :action => 'index'
  end

  def edit

  end

  def edit_submit

  end

  def delete

  end

end
