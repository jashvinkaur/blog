class SessionController < ApplicationController


def new
	session[:id]= @user.id
end

# def islogin
# 	if session[:id]
# 	   # @current_user = 	session[:id]
# 		render "login"
# 	else (session[:id]== nil)
# 		render "index"
# 	end	
# end

  def login
 		@user= User.where(:email => params[:email], :password => params[:password]).first
 		# @user = user.first
 		#debugger
 		unless @user.blank?
 			SessionController.new
 			session[:id]= @user.id
 			redirect_to(:controller=>"user" , :action=>"index")
 		else
 			render "login"
    end
  end

  def logout
  	 #debugger
  	session[:id]= nil
    @current_user= nil
  	render "login"
  	
  end

  def show
    @users= User.all
    
  end

# def destroy
# 	if session[:id]==nil
# 	session[:id].destroy

# 	end
#
end
		
