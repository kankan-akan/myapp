require 'rails_helper'

RSpec.describe "Lessons", type: :request do
  describe "Test Lessons(管理者ログイン)" do
    before do
      admin_range = create(:admin_range)
      login admin_range
      @lesson = create(:lesson)
      @calendar = create(:calendar)
    end

    context "range_lesson" do
      it "管理者の全レッスンを取得できる" do 
        get '/v1/lessons/range_lesson'
        expect(response).to have_http_status "200"
      end
    end

    context "create" do
      it "レッスンを作成できる" do
        post '/v1/lessons'
        expect(response).to have_http_status "200"
      end
    end

    context "update" do
      it "レッスンを更新できる" do
        put "/v1/lessons/#{@lesson.id}"
        expect(response).to have_http_status "200"
      end
    end

    context "destroy" do
      it "レッスンを削除できる" do
       delete "/v1/lessons/#{@lesson.id}"
       expect(response).to have_http_status "200"
      end
    end

  end
end
