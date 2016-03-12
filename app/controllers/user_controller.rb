class UserController < ApplicationController
	before_action :log_in?,  :except => [:login , :new, :create]
	# after_action :log_out?, :except => [:login , :new, :create]
	include UserHelper


	def index
		
		@posts = @current_user.posts
		@comments = @current_user.comments
		@users = User.all
		@posts= Post.all
		# @user= User.find(params[:id])
					# session[:id]= nil #session destroy

	end

	# def login
	# 	@user= User.where(:name => params[:name], :password => params[:password]).first
	# 	# @user = user.first
	# 	#debugger
	# 	unless @user.blank?
	# 		SessionController.new
	# 		session[:id]= @user.id
	# 		render "index"
	# 	else
	# 		render "login"
	#   end
	# end
	
	def show
		#debugger
		@user= User.find(params[:id])
    @post= @user.posts
    #@comment= Comment.find(params[:post_id])
	end
	
	# def log_out
	# end

	def new
		@user = User.new
		# @users = User.all
	end

	def create
		
		@user= User.new(user_params)
		#paaswod genrt
		# @user.password = 
		if @user.save
			redirect_to :user_index,   :notice => "User Created & Saved"
		else 	
			render "new"
		end
	end

	def edit
		@user= User.find(params[:id])
	end

	def update
			@user= User.find(params[:id])
		if @user.update_attributes(user_params)
			render "index",      :notice => "User Updated"
		else
			render "edit"
		end	
	end

	def destroy
		@user= User.find(params[:id])
		@user.destroy
		redirect_to :new_user , :notice => "User Deleted"
	end

	private
		def user_params
				params.require(:user).permit(:name,:password,:email, :contact, :college)
		end
end

	


	
	