class V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController

  private
    def sign_up_params
      params.permit(:name, :user_id, :email, :phone_number, :password, :avatar)
    end
 
    def account_update_params
      params.permit(:name, :user_id, :email, :phone_number, :password, :avatar)
    end

end
