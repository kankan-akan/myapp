require 'rails_helper'

RSpec.describe User, type: :model do
  it "ユーザー登録" do
    user = create(:user)
    expect(user).to be_valid
  end

  it "ユーザー登録失敗(重複)" do
    create(:user, email: "a@example.com")
    user = build(:user, email: "a@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end
