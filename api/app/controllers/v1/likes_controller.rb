class V1::LikesController < ApplicationController
  before_action :set_user, only: [:destroy]
  before_action :authenticate_v1_user!, except: [:user_likes, :index]

  def my_like
    @like = current_v1_user.likes.includes(:post).order(id: "DESC")
    render json: @like.as_json(include: [{post: { include: [like_users: { only: [:id, :name, :user_id, :avatar]} ] }} ])
  end

  def user_likes
    @user = User.find(params[:id])
    @like = @user.likes.includes(:post).order(id: "DESC")
    render json: @like.as_json(include: [{post: { include: [like_users: { only: [:id, :name, :user_id, :avatar]} ] }} ])
  end

  def index
    @like = Like.all
    render json: @like
  end

  def create
    @like = Like.new(like_params)
      if @like.save
        render json: { status: 200 }
      else
        render json: { status: 400 }
      end
    end

    def destroy
      @like = @user.unlike(@post)
        if @like.destroy
          render json: { status: 200 }
        else
          render json: { status: 400 }
        end
    end

    private
    def set_user
      @user = User.find(params[:user_id])
      @post = Post.find(params[:post_id])
    end

    def like_params
      params.permit(:user_id, :post_id)
    end

end
