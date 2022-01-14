
    class V1::Auth::UsersController < ApplicationController

      def members_only
        render json: {
          data: {
            message: "Wellcome",
            user: current_v1_auth_user
          }
        }, status: 200
      end

      def index
        @user = User.all
        render json: @user, status: :ok
      end
    end
  
