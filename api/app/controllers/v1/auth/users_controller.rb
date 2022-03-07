class V1::Auth::UsersController < ApplicationController

  def members_only
    @user = current_v1_user
    render json: @user
  end
end
  
