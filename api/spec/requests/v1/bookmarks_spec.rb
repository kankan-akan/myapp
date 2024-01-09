require 'rails_helper'

RSpec.describe "Bookmarks", type: :request do
  describe "Test bookmark(ログインしたユーザー)" do
    before do
      user = create(:user)
      login user
      @bookmark = create(:bookmark)
    end

    context "my_bookmark" do
      it "bookmarkした全練習場を取得できる" do
        get '/v1/bookmarks/my_bookmark'
        expect(response).to have_http_status "200"
      end
    end

    context "create" do
      it "bookmarkできる"do
        post "/v1/bookmarks"
        expect(response).to have_http_status "200"
      end
    end

    context "destroy" do
      it "bookmarkを削除できる" do
        delete "/v1/bookmarks", params: { user_id:@bookmark.user_id, range_outline_id:@bookmark.range_outline_id}
        expect(response).to have_http_status "200"
      end
    end

  end
end
