require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "Test User" do
    before do
      @user = create(:user)
      login @user
    end

    it "userを削除すると、userが書いたpostも削除する" do 
      @user.posts.create(content: 'example text')
      expect{ @user.destroy }.to change{ Post.count }.by(-1)
    end

    it "members_only" do
      get '/v1/auth/user'
      expect(response).to have_http_status "200"
    end

  end
end
