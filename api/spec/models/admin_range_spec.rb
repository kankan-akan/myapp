require 'rails_helper'

RSpec.describe AdminRange, type: :model do
  it "練習場管理者登録" do
    admin_range = create(:admin_range)
    expect(admin_range).to be_valid
  end

  it "練習場管理者登録失敗(重複)" do
    create(:admin_range, email: "a@example.com")
    admin_range = build(:admin_range, email: "a@example.com")
    admin_range.valid?
    expect(admin_range.errors[:email]).to include("has already been taken")
  end
end
