module api
  module v1
    class UsersController < ApplicationController
      def create 
        user = User.create(user_params)

        if user.save
          render json: { status: 'SUCCESS', message: 'Loaded user' }
        else
          render json: { status: 'ERROR', message: 'error the user'}
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :user_id, :email, :password)
      end
    end
  end
end
