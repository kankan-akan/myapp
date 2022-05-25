require 'rails_helper'

RSpec.describe "AdminRange", type: :request do
  describe "Test AdminRange" do
    before do
      admin_range = create(:admin_range)
      login admin_range
    end

    it "ranges_only" do
      get '/v1/range_auth/range'
      expect(response).to have_http_status "200"
    end

    it "index" do
      get '/v1/range_auth/ranges'
      expect(response).to have_http_status "200"
    end

  end
end

 