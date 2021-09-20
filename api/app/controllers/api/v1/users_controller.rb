module api
  module v1
    class UsersController < ApplicationController
      def create 
        post = User.create(user_params)

        if post.save
          render json: 'SUCCESS', status:200
        else
          render json: 'ERROR', status: 500
        end
      end

      private

      def user_params
        params.require(:post).permit(:name, :user_id, :email, :password)
      end
    end
  end
end
