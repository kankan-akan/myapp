class V1::RangeAuth::RangeOutlinesController < ApplicationController

  def index
    @outline = RangeOutline.includes(:equipment)
    render json: @outline.as_json(include: :equipment)
  end

  def show
    @outline = RangeOutline.includes(:equipment).find(params[:id])
    render json: @outline.as_json(include: :equipment)
  end

  def create
    @outline = RangeOutline.new(outline_params)
    if @outline.save
      render json: @outline, status: :created
    else
      render json: { status: 400}
    end
  end

  def update
    @outline = RangeOutline.find(params[:id])
    if @outline.update(outline_params)
      render json: @outline
    else
      render json: {status: 400 }
    end
  end

  def destroy
    @outline = RangeOutline.find(params[:id])
    if @outline.destroy
      render json: @outline
    else
      render json: { status: 400 }
    end
  end

  private
    def outline_params
      params.permit(:city, :name, :features, :link, :address, :phone_number, :distance, :booths, :admin_range)
    end
end
