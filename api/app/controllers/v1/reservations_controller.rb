class V1::ReservationsController < ApplicationController

  def my_reservation
    @reservation = current_v1_user.reservation.includes(:lesson)
    render json: @reservation
  end

  def range_reservation
    @reservation = Lesson.find(params[:lesson_id]).reservation.includes(:users)
    render json: @reservation
  end

  def show
    @reservation = Reservation.find(params[:id])
      render json: @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)
      if @reservation.save
        render json: @reservation
      else
        render json: { status: 400 }
      end
  end

  def update
    @reservation = Reservation.find(params[:id])
      if @reservation.update
        render json: @reservation
      else
        render json: { status: 400 }
      end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
      if @reservaton.destroy
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
