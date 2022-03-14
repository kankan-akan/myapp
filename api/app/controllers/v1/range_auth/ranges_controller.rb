class V1::RangeAuth::RangesController < ApplicationController

  def ranges_only
    render json: {
      data: {
            message: "Wellcome",
            admin: current_v1_admin_range
          }
    }, status: 200
  end
end