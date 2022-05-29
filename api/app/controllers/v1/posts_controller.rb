class V1::PostsController < ApplicationController
  # before_action :authenticate_v1_user!, except: [:user_posts, :index, :show]

  def my_post
    @post = current_v1_user.posts
    render json: @post
  end

  def user_posts
    @user = User.find(params[:id])
    @post = @user.posts
    render json: @post
  end

  def index
    @post = Post.includes(:user, :like_users)
    render json: @post.as_json(include: [:user, :like_users])
  end

  def show
    @post = Post.find(params[:id])
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
    post = Post.find(params[:id])
    if post.destroy
      render json: :destroy
    else
      render json: { status: 400 }
    end
  end

  private
   def post_params 
    params.permit(:user_id, :content)
   end

end
