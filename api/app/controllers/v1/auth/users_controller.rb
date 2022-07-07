class V1::Auth::UsersController < ApplicationController

  def members_only
    @user = current_v1_userr.includes(:followers, :followings)
    render json: @user.as_json(include: [followers: { only: [:id, :name, :user_id] }, followings: { only: [:id, :name, :user_id] } ])
  end
end
  
