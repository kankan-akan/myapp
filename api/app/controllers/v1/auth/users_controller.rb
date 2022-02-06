class V1::Auth::UsersController < ApplicationController

  def members_only
    render json: {
      data: {
        message: "Wellcome",
        user: current_v1_user
      }
    }, status: 200
  end

  def index
    @user = User.all
    render json: @user, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end
end
  
