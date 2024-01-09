require 'rails_helper'

RSpec.describe "RangeOutlines", type: :request do
  describe "Test Outlines" do
    before do
      admin_range = create(:admin_range)
      login admin_range
      @outline = create(:range_outline)
      @equipment = create(:equipment)
    end

    context "create" do
      it "outlineかつequipmentが保存される" do
        post '/v1/outlines'
        expect(response).to have_http_status "200"
      end
    end

    context "update" do
      it "status 200" do
        put "/v1/outlines/#{@outline.id}", params: { feature: 'new content' }
        expect(response).to have_http_status "200"
      end
    end

  context "destroy"
    it "status 200" do
      delete "/v1/outlines/#{@outline.id}"
      expect(response).to have_http_status "200"
    end
  end

end
