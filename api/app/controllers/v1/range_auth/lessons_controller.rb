class V1::RangeAuth::LessonsController < ApplicationController

  def range_lesson
    @lesson = authenticate_v1_range_auth_admin.lesson
    render json: @lesson
  end

  def index
    @lesson = Lesson.includes(:range_outline, :review)
    render json: @lesson.as_json(include: :range_outline, :review)
  end

  def show
    @lesson = Lesson.includes(:range_outline, :review).find(params[:id])
    render json: @lesson.as_json(include: :range_outline, :review)
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
