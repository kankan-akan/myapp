class V1::RangeAuth::RangesController < ApplicationController

  def ranges_only
    @range = current_v1_admin_range
    render json: @range
  end

  def index
    @range = AdminRange.all
    render json: @range
  end
end