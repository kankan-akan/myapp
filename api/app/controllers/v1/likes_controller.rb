class V1::LikesController < ApplicationController
  before_action :set_user, only: [:destroy]

  def like_users
    @post = Post.find(params[:post_id])
    @like_users = @post.like_users
      render json: @like_users
  end

  def create
    @like = Like.new(like_params)
      if @like.save
        render json: @like
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
