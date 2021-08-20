class Api::V1::HelloController < ApplicationController
  def index
    render json: "Hello Api"
  end
end
