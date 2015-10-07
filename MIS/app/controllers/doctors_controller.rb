class DoctorsController < ApplicationController
  def new
  end
  
  def show
    @doctor = Doctor.find(params[:id])
  end
  
  def index
	@doctors = Doctor.all
	@valid = filter_action(["ADMIN"])
	@main_route = main_route()
  end
  
  def login
	  p "DOCTOR_LOGIN"
  end
  
  def login_submit
  	  p params[:username]
	  @docUser = authenticate(params[:username])
	  if @docUser == false
		redirect_to :action => 'login'#Redirect to the doctor login screen if login failed
	  else
		  session[:firstname] = @docUser[:name_first]#Store name in session
		  session[:lastname] = @docUser[:name_last]
		  session[:access_id] = "DOCTOR" #Set access identifier
		  session[:user_id] = @docUser[:id] #Store user ID for the current user during this session
		  p "USER NAME IS:" + session[:firstname] + " "+ session[:lastname]
		  p "USER IS A: " + session[:access_id]
		  redirect_to :action => 'main'
	  end
  end
  
  def main
	@firstname = session[:firstname]
	@lastname = session[:lastname]
  end
  
  def register
	
  end
  
  def register_submit
	@doctor = Doctor.create(:name_first => params[:first_name], :name_last => params[:last_name], :specialty => params[:specialty])
	redirect_to :action => 'index'
  end

  #edit and edit_submit expect a parameter "id" that contains the id of the doctor to edit:
  def edit
  	#Get doctor entry to edit from database, store in editDoctor variable:
  	@editDoctor = Doctor.find_by_id(params[:id])
  end

  def edit_submit
  	@editDoctor = Doctor.find_by_id(params[:id])
  	#Save changes back into the database:
  	@editDoctor.update_attributes(:name_first => params[:first_name], :name_last => params[:last_name], :specialty => params[:specialty])
  	#Go back to the doctor index:
	redirect_to :action => 'index'
  end

  
  def authenticate(username="")
	@loginDoctor = Doctor.find_by_id(username[2..-1])
	if @loginDoctor == nil
		return false
	else
		if @loginDoctor[:name_first][0] == username[0] && @loginDoctor[:name_last][0] == username[1]
			p "NAME MATCHES INITIALS"
			return @loginDoctor
		else
			return false
		end
	end
  end
  
  def delete
  	if filter_action(["ADMIN"]) == true
		Doctor.destroy(params[:id])
		p "DELETED"
	end
	redirect_to :action => 'index'
  end
  
  def logout
	session[:access_id] = nil
	session[:firstname] = nil
	session[:lastname] = nil
	session[:user_id] = nil
	redirect_to :controller => 'welcome', :action => 'main'
  end
  
end
