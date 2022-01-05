class V1::Auth::PostsController < ApplicationController

  def index
    @post = Post.includes(:users)
    render json: @post.as_json(include: :users)
  end

  def show
    @post = current_v1_auth_user.post
    # @post = Post.includes(:users).find(params[:id])
    render json: @post
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: { status: 400 }
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      render json: :destroy
    else
      render json: { status: 400 }
    end
  end

  private
   def post_params 
    params.require(:post).permit(:content)
   end

end