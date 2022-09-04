class V1::LessonsController < ApplicationController
  before_action :authenticate_v1_admin_range!, except: [:index, :show]

  def range_lesson
    @lesson = current_v1_admin_range.lessons.includes(:calendar, :reservations)
    render json: @lesson.as_json(include: [:calendar, :reservations])
  end

  def index
    @lesson = Lesson.includes(:calendar)
    render json: @lesson.as_json(include: :calendar)
  end

  def show
    @lesson = Lesson.includes(:reviews).find(params[:id])
    calendar = Calendar.where(lesson_id: params[:id]).select(:lesson_time, :lesson_id)
    holiday = Calendar.where(lesson_id: params[:id]).pluck(:sun, :mon, :tue, :wed, :thu, :fri, :sat).flatten.compact
    start_times = Calendar.where(lesson_id: params[:id]).pluck(:start_time1, :start_time2, :start_time3, :start_time4, :start_time5, :start_time6, :start_time7, :start_time8, :start_time9,:start_time10, :start_time11, :start_time12).flatten.compact
    render json: { lesson: @lesson.as_json(include: :reviews), calendar: calendar, holiday: holiday, start_times: start_times }
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
    params.permit(:title, :coach, :content, :admin_range_id, :range_outline_id, calendar_attributes: [:lesson_time, :start_time1, :start_time2, :start_time3, :start_time4, :start_time5, :start_time6,:start_time7, :start_time8, :start_time9, :start_time10, :start_time11, :start_time12, :sun, :mon, :tue, :wed, :thu, :fri, :sat, :lesson_id])
  end

end
