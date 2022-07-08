class V1::Auth::UsersController < ApplicationController

  def members_only
    @user = User.includes(:followers, :followings).find(current_v1_user.id)
    render json: @user.as_json(include: [followers: { only: [:id, :name, :user_id, :avatar] }, followings: { only: [:id, :name, :user_id, :avatar] } ])
  end
end
  
