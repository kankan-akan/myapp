class V1::LessonsController < ApplicationController

  def range_lesson
    @lesson = current_v1_admin_range.lessons.includes(:calendar, :reservations, :users)
    render json: @lesson.as_json(include: [:calendar, :reservations, users: { only: [:name, :email]}])
  end

  def index
    @lesson = Lesson.includes(:calendar)
    render json: @lesson.as_json(include: :calendar)
  end

  def show
    @lesson = Lesson.includes(:calendar, :reviews, :calendar).find(params[:id])
    render json: @lesson.as_json(include: [:calendar, :reviews, :calendar])
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      render json: @lesson.as_json(include: [:calendar])
    else
      render json: { status: 400 }
    end
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      render json: @lesson.as_json(include: [:calendar])
    else
      render json: { status: 400 }
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    if @lesson.destroy
      render json: { status: 200 }
    else
      render json: { status: 400 }
    end
  end

  private

  # def lesson_params
  #   params.permit(:title, :coach, :content, :admin_range_id, :range_outline_id)
  # end

  # def calendar_params
  #   params.permit(:lesson_time, :start_time, :holiday, :lesson_id)
  # end

  def lesson_params
    params.permit(:title, :coach, :content, :admin_range_id, :range_outline_id, calendar_attributes: [:lesson_time, :start_time, :holiday])
  end

end
