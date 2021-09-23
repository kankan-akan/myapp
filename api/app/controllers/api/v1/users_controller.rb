module Api
  module V1
    class UsersController < ApplicationController
      def create 
        user = User.create(user_params)

        if user.save
          render json: { text: '☑︎登録が完了しました。', status: 200, data: user}
        else
          render json: { text: '登録に失敗しました。', status: 500, data: user.errors }
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :user_id, :email, :password)
      end
    end
  end
end
