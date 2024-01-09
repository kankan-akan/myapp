require 'rails_helper'

RSpec.describe "Reservations", type: :request do
  describe "Test reservation(ログインしたユーザー)" do
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
        post '/v1/reservations', params: { user_id: @reservation.user_id }
        expect(response).to have_http_status "200"
      end
    end

    context "update" do
      it "予約を変更できる" do
        put "/v1/reservations/#{@reservation.id}", params: { date: "22/1/24(月)10:00" }
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

  describe "Test reservation(管理者ログイン)" do
    before do
      admin_range = create(:admin_range)
      login admin_range
      @lesson = create(:lesson)
    end

    context "search_reservation" do
      it "予約状況を日付で検索できる" do
        reservation = create(:reservation)
        get "/v1/reservations/search/#{@lesson.id}", params: { date: "'22/1/23(日)10:00'" }
        expect(response).to have_http_status "200"
      end
    end
  end
end
