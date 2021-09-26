module Api
  module V1
    class UsersController < ApplicationController
      def create 
        user = User.create(user_params)

        if user.save
          render json: {text: 'succes', status: 200, data: user}
        else
          render json: {text: 'error', status: 500, data: user.errors }
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :user_id, :email, :password)
      end
    end
  end
end
