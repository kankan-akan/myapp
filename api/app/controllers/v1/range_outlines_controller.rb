class V1::RangeOutlinesController < ApplicationController
  # before_action :authenticate_v1_admin_range!, except: [:index]

  # def range_info
  #   @outline = current_v1_admin_range.range_outline&.includes(:equipment)
  #   render json: @outline.as_json(include: :equipment)
  # end

  def index
    @outline = RangeOutline.includes(:equipment, :lessons)
    render json: @outline.as_json(include: [:equipment, :lessons, {bookmark_users: { only: [:id, :name, :user_id, :avatar]} } ])
  end

  def show
    @outline = RangeOutline.includes(:equipment).find(params[:id])
    render json: @outline.as_json(include: :equipment)
  end

  def create
    @outline = RangeOutline.new(outline_params)
    @equipment = Equipment.new(equipment_params)
    if @outline.save && @equipment.save
      render json: { outline: @outline, equipment: @equipment }
    else
      render json: { status: 400 }
    end
  end

  def update
    @outline = RangeOutline.find(params[:id])
    @equipment = Equipment.find_by(params[:admin_range_id])
    if @outline.update(outline_params) && @equipment.update(equipment_params)
      render json: { outline: @outline, equipment: @equipment }
    else
      render json: {status: 400 }
    end
  end

  def destroy
    @outline = RangeOutline.find(params[:id])
    @equipment = Equipment.find_by(params[:admin_range_id])
    if @outline.destroy && @equipment.destroy
      render json: { status: 200 }
    else
      render json: { status: 400 }
    end
  end

  private
    def outline_params
      params.permit(:city, :name, :features, :link, :address, :phone_number, :distance, :booths, :admin_range_id)
    end

    def equipment_params
      params.permit(:uchihoudai, :approach, :lefty, :patting, :bunker, :shop, :restaurant, :lesson, :admin_range_id)
    end
end
