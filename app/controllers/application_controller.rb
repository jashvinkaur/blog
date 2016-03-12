class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_action :log_in?,  :except => :new
  # around_filter :set_time_zone

  def log_in?
	 if session[:id]
    @current_user= User.find(session[:id])
		true
	 else
		#flash[:notice] => "Login_require"
		redirect_to(:controller => 'session', :action => 'login')
    end
  end
  
  def log_out?
   # debugger
    if session[:id]
      false
      redirect_to(:controller => 'session', :action => 'login')
    end 
   end 



  # def set_time_zone
  #   if log_in?
  #     Time.use_zone(@current_user.time_zone) { yield }
  #   else
  #     yield
  #   end
  # end
end

