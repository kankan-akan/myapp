class V1::ReservationsController < ApplicationController
  before_action :authenticate_v1_user!, except: [:search_reservation]
  before_action :authenticate_v1_admin_range!, only: [:search_reservation]

  def my_reservation
    @reservation = current_v1_user.reservations.includes(:lesson).order(id: "DESC")
    render json: @reservation.as_json(include: :lesson)
  end

  def search_reservation
    @lesson = Lesson.find(params[:id])
    @reservation = @lesson.reservations.where('date LIKE ?', "#{params[:date]}").includes(:user)
    render json: @reservation.as_json(include: [user: { only: [:name, :phone_number] } ])
  end

  def show
    @reservation = Reservation.find(params[:id])
      render json: @reservation
  end

  def create
    @user = User.find(params[:user_id])
    if @user.reservations.where('date LIKE ?', "#{params[:date]}").count < 1
      @reservation = Reservation.new(reservation_params)
        if @reservation.save
          render json: @reservation
        else
          render json: { status: 400 }
        end
    else
      render status: 409  #日付の重複
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
      if @reservation.update(reservation_params)
        render json: @reservation
      else
        render json: { status: 400 }
      end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
      if @reservation.destroy
        render json: @reservation
      else
        render json: { status: 400 }
      end
  end


  private

    def reservation_params
      params.permit(:lesson_id, :user_id, :date)
    end

end
