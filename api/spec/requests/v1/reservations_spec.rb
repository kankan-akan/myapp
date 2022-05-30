require 'rails_helper'

RSpec.describe "Reservations", type: :request do
  describe "Test lesson(ログインしたユーザー)" do
    before do
      user = create(:user)
      login user
      @reservation = create(:reservation)
    end

    context "my_reservation" do
      it "予約したすべての予約を取得できる" do
        get '/v1/reservations/my_reservation'
        expect(response).to have_http_status "200"
      end
    end

    context "show" do
      it "選択した予約を取得できる" do
        get "/v1/lessons/#{@reservation.lesson_id}/reservations/#{@reservation.id}"
        expect(response).to have_http_status "200"
      end
    end

    context "create" do
      it "予約できる" do
        post '/v1/reservations' 
        expect(response).to have_http_status "200"
      end
    end

    context "update" do 
      it "予約を変更できる" do
        put "/v1/reservations/#{@reservation.id}", params: { date: "1/24 10:00" }
        expect(response).to have_http_status "200"
      end
    end

    context "destroy" do
      it "予約を削除できる" do
        delete "/v1/reservations/#{@reservation.id}"
        expect(response).to have_http_status "200"
      end
    end

  end
end
