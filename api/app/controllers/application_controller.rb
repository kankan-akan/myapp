class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken

        before_action :authenticate_v1_user!
        # before_action :authenticate_v1_admin!
end
