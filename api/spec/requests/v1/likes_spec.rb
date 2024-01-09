require 'rails_helper'

RSpec.describe "Likes", type: :request do
  describe "Test likes(ログインしたユーザー)" do
    before do
      @user = create(:user)
      login @user
      @like = create(:like)
    end

    context "my_like" do
      it "いいねした投稿を取得できる" do
        get '/v1/likes/my_like'
        expect(response).to have_http_status "200"
      end
    end

    context "create" do
      it "ログイン状態でいいねできる" do
        post '/v1/likes'
        expect(response).to have_http_status "200"
      end
    end

    context "destroy" do
      it "ログイン状態で取り消しできる" do
        delete '/v1/likes', params: { user_id: @like.user_id, post_id: @like.post_id }
        expect(response).to have_http_status "200"
      end
    end
  end

  describe "Test likes" do
    context "user_likes" do
      it "選択したユーザーのいいねを取得できる" do
        user = create(:user)
        get "/v1/likes/user_likes/#{user.id}"
        expect(response).to have_http_status "200"
      end
    end
  end

end
