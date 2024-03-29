class V1::PostsController < ApplicationController
  before_action :authenticate_v1_user!, except: [:user_posts, :index, :show]

  def my_post
    @post = current_v1_user.posts.includes(:like_users).order(id: "DESC")
    render json: @post.as_json(include: [like_users: { only: [:id, :name, :user_id, :avatar]} ])
  end

  def user_posts
    # @user = User.find(params[:id])
    @post = User.find(params[:id]).posts.includes(:like_users).order(id: "DESC")
    render json: @post.as_json(include: [like_users: { only: [:id, :name, :user_id, :avatar]} ])
  end

  def index
    @post = Post.includes(:user, :like_users).order(id: "DESC")
    render json: @post.as_json(include: [{user: { only: [:id, :name, :user_id, :avatar] }}, {like_users: { only: [:id, :name, :user_id, :avatar] }} ])
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
      params.permit(:user_id, :content, :range, :image)
    end

end
