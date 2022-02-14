class V1::BookmarksController < ApplicationController
  before_action :set_user, only: [:destroy]

  def my_bookmark
    @bookmark = @user.bookmarks
      render json: @bookmark
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
      if @bookmark.save
        render json: @bookmark
      else
        render json: { status: 400 }
      end
  end

  def destroy
    @bookmark = @user.unbookmark(@outline)
      if @bookmark.destroy
        render json: { status: 200 }
      else
        render json: { status: 400 }
      end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
    @outline = RangeOutline.find(params[:range_outline_id])
  end

  def bookmark_params
    params.permit(:user_id, :range_outline_id)
  end

end