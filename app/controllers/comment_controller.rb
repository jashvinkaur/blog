class CommentController < ApplicationController
	before_action :log_in?

  def new
  	#debugger
  	@comment= Comment.new
  end
 
  def create
 
  	@comment= @current_user.comments.new(comment_params)
  	#@comment.post_id = params[:comment][:post]
  	@comment.save
  	redirect_to :user_index
  end

  # def index
  # 	@user= User.find(params[:id])
  # 	@post= Post.find(params[:user_id])
  # 	@comment= Comment.find(params[:post_id])
  	
  # end

  def edit
  	@comment=Comment.find(params[:id])
  end

  def update
 	
  	@comment=Comment.find(params[:id])
		if @current_user.id == @comment.user_id 
			@comment.update_attributes(comment_params)
    end
			redirect_to :user_index
	end		

  	
  	

	def destroy
		
		@comment=Comment.find(params[:id])
		if @current_user.id == @comment.user_id
			@comment.destroy
		else
		# :notice =>"Only User can delete"	
	end
		redirect_to :user_index
	end  	
			
		

	  	
	private
	def comment_params
		params.require(:comment).permit(:user_id,:post_id,:description)
	end  		

end
	  			
