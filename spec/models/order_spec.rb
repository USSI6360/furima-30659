require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @buy = FactoryBot.build(:buy)
    @item = FactoryBot.build(:item) ##item, user を保存する
    @order = FactoryBot.build(:order) #保存したitem, userのidを直接入力する
  end

  it "tokenがあれば保存ができること" do
    expect(@order).to be_valid
  end

  t "tokenが空では登録できないこと" do
    @buy.token = nil
    @buy.valid?
    expect(@buy.errors.full_messages).to include("Token can't be blank")
  end
end
