class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def filter_action(filter = [])
	if session[:access_id] == nil
		return false
	else
		filter.each do |filter_item|
			if filter_item == session[:access_id]
				return true
			end
		end
	return false
  end
  end
  
  def main_route() #returns route to the main page of the current user type
	if session[:access_id] == "ADMIN"
		return "/admin/main"
	elsif session[:access_id] == "PATIENT"
		return "/patients/main"
	elsif session[:access_id] == "DOCTOR"
		return "/doctors/main"
	elsif session[:access_id] == "NURSE"
		return "/nurses/main"
	elsif session[:access_id] == "HSPSTAFF"
		return "/hspstaffs/main"
	elsif session[:access_id] == "LABSTAFF"
		return "/labstaff/main"
	elsif session[:access_id] == "PHARMACIST"
		return "/pharmacist/main"
	end
  end
end
