class V1::RelationshipsController < ApplicationController
  before_action :set_user

  def create
    @relationship = @user.follow(@follower)
      if @relationship.save
        render json: @relationship
      else
        render json: { status: 400 }
      end
  end

  def destroy
    @relationship = @user.unfollow(params[:id])
    if @relationship.destroy
      render json: { status: 200 }
    else
      render json: { status: 400 }
    end
  end

  private

    def set_user
      @user = User.find(params[:user_id])
      @folllower = User.find(params[:follower_id])
    end

end
