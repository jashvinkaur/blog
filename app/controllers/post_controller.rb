class PostController < ApplicationController
  before_action :log_in?

  def index
    @posts = @current_user.posts.all
  end
    
  
  def new
  	@post = Post.new
  end

  def create
  	@post = @current_user.posts.new(post_params)
  	#debugger
  	@post.save
  	redirect_to :user_index
  end
 
  def edit
    @post= Post.find(params[:id]) 
  end   

  def update
    @post= Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to :post_index,     :notice => "Post Updated"
    else
      render "edit"
    end
  end
    
    

  def destroy
  	@post= Post.find(params[:id])
		@post.destroy
		redirect_to :post_index, :notice => "User Deleted"
  	
  end

  private
    def post_params
    	params.require(:post).permit(:title, :description)
    end


end
