class AdminController < ApplicationController
  def main
  
  end
  
  def login
	p "ADMIN LOGIN" #Print ADMIN LOGIN to console
  end
  
  def login_submit
      p params[:username]
	  p params[:password]
	  #if authenticate(params[:username], params[:password]) == true
		p "ADMIN LOGIN SUCCESS"
		#Set session variables
	    session[:firstname] = "GROUP3"#Store user first name
		session[:lastname] = "ADMIN"#Store user last name
		session[:access_id] = "ADMIN"#Set user access to ADMIN
		session[:user_id] = 0
	    p "USER NAME IS: " + session[:firstname] + " " + session[:lastname]
		p "USER IS A: "+session[:access_id]
		redirect_to :action => 'main'#Call the main action in this controller
	  #else
		#redirect_to :action => 'login'
	 # end
  end
  
  def main
  	#store firstname and lastname session variables in instange variables:
  	@firstname = session[:firstname]
	@lastname = session[:lastname]
  end
  
  def authenticate(username = "", password = "")
	if params[:username] == "Group3" && params[:password]=="CSE360"
	  return true
	else
	  return false
	end
  end
  
  def logout
  	#Reset all session variables to nil on logout
	session[:access_id] = nil
	session[:firstname] = nil
	session[:lastname] = nil
	session[:user_id] = nil
	#go back to the welcome screen by calling the main action of welcome_controller
	redirect_to :controller => 'welcome', :action => 'main'
  end
  
end
