class V1::PostsController < ApplicationController
  # before_action :authenticate_v1_user!, except: [:index, :show]

  def my_post
    @post = current_v1_user.posts
    render json: @post
  end

  def index
    @post = Post.includes(:user)
    render json: @post.as_json(include: :user)
  end

  def show
    @post = Post.includes(:users).find(params[:id])
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
