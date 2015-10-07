class AppointmentController < ApplicationController
  def index
	if session[:access_id] == "ADMIN"#check if user is admin
		@appointments = Appointment.all
		@headertext = "All Appointments"
	else
		@appointments = Appointment.where(:patient_id => session[:user_id]]).all
		@headertext = "Appointments for " + session[:firstname] + " "+ session[:lastname]
	end
	@valid = filter_action(["ADMIN"])
  end
  
  def create
  	#toggle the "Patient" field in the create appointment form view
  	#if user is an Admin, the Patient field is shown, admin can select patient for the appointment being created:
	if session[:access_id] == "ADMIN"
		@patient_field = true
	else
		@patient_field = false
	end
	
  end

  def create_submit
  p "CREATE_SUBMIT"
  p params[:datetime]
  	@appointment = Appointment.create(:patient_id => session[:user_id], :doctor_id => params[:doctor_id], :date_time => params[:datetime])
	redirect_to :action => 'index'
  end

  def edit
  end
end
