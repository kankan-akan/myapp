require 'rails_helper'

RSpec.describe "Relationships", type: :request do
  describe "Test relationship(ログインしたユーザー)" do
    before do
      user = create(:user)
      login user
      @relationship = create(:relationship)
    end

    context "create" do
      it "他のユーザーをフォローできる" do
        post '/v1/relationships', params: { user_id:@relationship.user_id, follower_id:@relationship.follower_id }
        expect(response).to have_http_status "200"
      end
    end

    context "destroy" do
      it "フォローを解除できる" do
        delete '/v1/relationships', params: { user_id:@relationship.user_id, follower_id:@relationship.follower_id }
        expect(response).to have_http_status "200"
      end
    end
  end
end
