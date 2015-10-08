class AdminController < ApplicationController
  def main
  
  end
  
  def login
	p "ADMIN LOGIN"
  end
  
  def login_submit
      p params[:username]
	  p params[:password]
	  #if authenticate(params[:username], params[:password]) == true
		p "ADMIN LOGIN SUCCESS"
	    session[:firstname] = "GROUP3"
		session[:lastname] = "ADMIN"
		session[:access_id] = "ADMIN"
		session[:user_id] = 0
	    p "USER NAME IS: " + session[:firstname] + " " + session[:lastname]
		p "USER IS A: "+session[:access_id]
		redirect_to :action => 'main'
	  #else
		#redirect_to :action => 'login'
	 # end
  end
  
  def main
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
	session[:access_id] = nil
	session[:firstname] = nil
	session[:lastname] = nil
	session[:user_id] = nil
	redirect_to :controller => 'welcome', :action => 'main'
  end
  
end
