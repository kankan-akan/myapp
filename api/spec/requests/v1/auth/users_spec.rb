require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "Test User" do
    before do
      user = create(:user)
      login user
    end

    it "members_only" do
      get '/v1/auth/user'
      expect(response).to have_http_status "200"
    end

  end
end
