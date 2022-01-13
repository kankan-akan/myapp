class V1::RangeAuth::RangesController < ApplicationController

  def ranges_only
    render json: {
      data: {
            message: "Wellcome",
            admin: current_v1_range_auth_admin
          }
    }, status: 200
  end

end