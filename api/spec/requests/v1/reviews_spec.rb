require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  describe "Test reviews(ログインしたユーザー)" do
    before do
      user = create(:user)
      login user
      @review = create(:review)
    end

    context "my_review" do
      it "作成したレビューを取得できる" do
        get '/v1/reviews/my_review' 
        expect(response).to have_http_status "200"
      end
    end

    context "create" do
      it "レビューを作成できる" do
        post '/v1/reviews'
        expect(response).to have_http_status "200"
      end
    end

    context "update" do
      it "レビューを更新できる" do
        put "/v1/reviews/#{@review.id}", params: { rate: 5.0 }
        expect(response).to have_http_status "200"
      end
    end

    context "destroy" do
      it "レビューを削除できる" do
        delete "/v1/reviews/#{@review.id}"
        expect(response).to have_http_status "200"
      end
    end

  end
end
