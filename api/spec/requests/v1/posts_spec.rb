require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "Test post(ログインしたユーザー)" do
    before do
      user = create(:user)
      login user
      @post = create(:post)
    end

    context "my_post" do
      it "ユーザーの全投稿を取得できる" do
        get '/v1/posts/my_post'
        expect(response).to have_http_status "200"
      end
    end

    context "create" do 
      it "投稿を保存できる" do
        post '/v1/posts' 
        expect(response).to have_http_status "200"
      end
    end

    context "destroy" do
      it "投稿を削除できる" do
        delete "/v1/posts/#{@post.id}"
        expect(response).to have_http_status "200"
      end
    end
  end

  describe "Test posts" do
    context "user_posts" do
      it "選択したユーザーの情報を取得できる" do
        user = create(:user)
        get "/v1/posts/user_posts/#{user.id}"
        expect(response).to have_http_status "200"
      end
    end

    context "index" do 
      it "全投稿を取得できる" do
        get "/v1/posts"
        expect(response).to have_http_status "200"
      end
    end

    context "show" do 
      it "選択した投稿を取得できる" do
        post = create(:post)
        get "/v1/posts/#{post.id}"
        expect(response).to have_http_status "200"
      end
    end
  end

end
