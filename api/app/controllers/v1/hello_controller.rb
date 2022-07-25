class V1::HelloController < ApplicationController

  def index
    head 200
    # render json: { status: 200 }
  end

end
