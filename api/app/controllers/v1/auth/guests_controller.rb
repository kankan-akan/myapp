class V1::Auth::GuestsController < ApplicationController

  def create
    random_value = SecureRandom.hex(1) # ランダムな2文字の文字列を生成
    random_pass = SecureRandom.hex(4) # ランダムな8文字の文字列を生成
    user_params = {
      name: "guest-user",
      user_id: "guest_user#{random_value}",
      email: "guest_#{random_value}@example.com",
      password: "#{random_pass}"
    }
    user = User.create!(user_params)
    render json: { email: user.email, password: user.password }
  end

  def guest_sign_in

  end
end
