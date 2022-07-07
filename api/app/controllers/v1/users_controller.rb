class V1::UsersController < ApplicationController

  def index
    @user = User.all
    render json: @user
  end

  def show
    @user = User.includes(:followers, :followings).find(params[:id])
    render json: @user.as_json(include: [followers: { only: [:id, :name, :user_id] }, followings: { only: [:id, :name, :user_id] } ])
  end
end