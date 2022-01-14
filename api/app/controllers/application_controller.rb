class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken

        # before_action :authenticate_v1_auth_user!
        #before_action :authenticate_v1_range_auth_admin!
end
