require 'rails_helper'
RSpec.describe Buy, type: :model do
  describe '#create' do
    before do
      @buy = FactoryBot.build(:buy)

    end

    it "yubinとprefecture_id、municipalityとnumber,tellが存在すれば登録できること" do
      expect(@buy).to be_valid
    end

    it "yubinが空では登録できないこと" do
      @buy.yubin = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Yubin is invalid")
    end
    it "yubinに-が抜けては登録できない" do
      @buy.yubin = '1234567'
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Yubin is invalid")
    end
    it "prefecture_idが空では登録できないこと" do
      @buy.prefecture_id = 0
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Prefecture must be other than 0")
    end
    it "municipalityが空では登録できないこと" do
      @buy.municipality = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Municipality is invalid")
    end
    it 'municipalityが全角でないと保存できないこと' do
      @buy.municipality = "abe"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Municipality is invalid")
    end
    it "numberが空では登録できないこと" do
      @buy.number = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Number can't be blank")
    end
    it "tellが空では登録できないこと" do
      @buy.tell = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Tell is invalid")
    end

      it "tellが11文字でないと登録できない" do
        @buy.tell = "1"
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Tell is invalid")
      end
      it "tellが数字のみでないと登録できない" do
        @buy.tell = "1"
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Tell is invalid")
      end

       it"tokenが空では登録できないこと" do
        @buy.token = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include("Token can't be blank")
      end
  end
end
