class V1::ReviewsController < ApplicationController
  before_action :authenticate_v1_user!

  def my_review
    @review = current_v1_user.reviews
      render json: @review
  end

  def create
    @review = Review.new(review_params)
      if @review.save
        render json: @review
      else
        render json: { status: 400 }
      end
  end

  def update
    @review = Review.find(params[:id])
      if @review.update(review_params)
        render json: @review
      else
        render json: { status: 400 }
      end
  end

  def destroy
    @review = Review.find(params[:id])
      if @review.destroy
        render json: @review
      else
        render json: { status: 400 }
      end
  end

  private

  def review_params
    params.permit(:review, :rate, :lesson_id, :user_id)
  end

end
