class V1::LessonsController < ApplicationController

  def range_lesson
    @lesson = current_v1_admin_range.lessons.includes(:reservations, :users)
    render json: @lesson.as_json(include: [:reservations, users: { only: [:name, :email]}])
  end

  def index
    @lesson = Lesson.includes(:range_outline)
    render json: @lesson.as_json(include: :range_outline)
  end

  def show
    @lesson = Lesson.includes(:range_outline, :reviews).find(params[:id])
    render json: @lesson.as_json(include: [:range_outline, :reviews])
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      render json: @lesson
    else
      render json: { status: 400 }
    end
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      render json: @lesson
    else
      render json: { status: 400 }
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    if @lesson.destroy
      render json: post
    else
      render json: { status: 400 }
    end
  end

  private

  def lesson_params
    params.permit(:title, :coach, :content, :admin_range_id, :range_outline_id)
  end
end
