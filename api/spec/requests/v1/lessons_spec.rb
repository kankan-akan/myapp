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
      it "status 200" do 
        get '/v1/lessons/range_lesson'
        expect(response).to have_http_status "200"
      end
    end

    context "create" do
      it "status 200" do
        post '/v1/lessons'
        expect(response).to have_http_status "200"
      end
    end

    context "update" do
      it "status 200" do
        put "/v1/lessons/#{@lesson.id}"
      expect(response).to have_http_status "200"
      end
    end

    context "destroy" do
      it "status 200" do
       delete "/v1/lessons/#{@lesson.id}"
       expect(response).to have_http_status "200"
      end
    end
    
  end
end
