require 'rails_helper'

RSpec.describe Buy, type: :model do
  describe '#create' do
    before do
      @buy = FactoryBot.build(:item)
    end

    it "yubinとprefecture_id、municipalityとnumber,tellが存在すれば登録できること" do
      expect(@item).to be_valid
    end

    it "yubinが空では登録できないこと" do
      @buy.image = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Yubin can't be blank")
    end
    it "yubinに-が抜けては登録できない" do
      @buy.yubin = 'ii'
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Yubin is invalid")
    end
    it "prefecture_idが空では登録できないこと" do
      @buy.prefecture_id = 0
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Prefecture must be other than 0")
    end
    it "municipalityが空では登録できないこと" do
      @buy.image = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("municipality can't be blank")
    end
    it 'municipalityが全角でないと保存できないこと' do
      @buy.municipality = "abe"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Municipality is invalid")
    end
    it "numberが空では登録できないこと" do
      @buy.image = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("number can't be blank")
    end
    it "tellが空では登録できないこと" do
      @buy.image = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("tell can't be blank")
      it "tellが11文字でないと登録できない" do
        @buy.password = "11111111111"
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
