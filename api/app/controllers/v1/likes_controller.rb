class V1::LikesController < ApplicationController
  before_action :set_user, only: [:destroy]

  def my_like
    @like = current_v1_user.likes.includes(:post)
    render json: @like.as_json(include: :post)
  end

  def user_likes
    @user = User.find(params[:id])
    @like = @user.likes
    render json: @like
  end

  def count
    @post = Post.find(params[:post_id])
    @like = @post.likes.size
    render json: @like
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
      params.require(:like).permit(:user_id, :post_id)
    end

end
