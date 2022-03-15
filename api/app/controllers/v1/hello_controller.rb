class V1::HelloController < ApplicationController

  def index
    render json: { message: 'Hello' }
  end

end
