require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "imageとproduct_name、instructionsとcategory_id,status_id,burden_id,prefecture_id,days_idとpriceが存在すれば登録できること" do
      expect(@item).to be_valid
    end

    it "imageが空では登録できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "product_nameが空では登録できないこと" do
      @item.product_name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end

    it "instructionsが空では登録できないこと" do
      @item.instructions = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Instructions can't be blank")
      end

    it "category_idが空では登録できないこと" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end
    it "status_idが空では登録できないこと" do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 0")
      end
    it "burden_idが空では登録できないこと" do
      @item.burden_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden must be other than 0")
      end
    it "prefecture_idが空では登録できないこと" do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end
    it "days_idが空では登録できないこと" do
      @item.days_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Days must be other than 0")
      end
    it "priceが空では登録できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが全角では登録できないこと" do
        @item.price = '１２３４５６'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
        end

        it "priceが299以下だと出品登録できない" do
           @item.price = 298
           @item.valid?
           expect(@item.errors.full_messages).to include("Price must be greater than 299")
           end
        it "priceが9,999,999以上だと出品登録できない" do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than 10000000")
         end
  end
end
