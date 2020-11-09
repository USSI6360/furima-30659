require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        @user.valid?
      end
      it "nicknameが6文字以下で登録できる" do
        @user.nickname = "aaaaaa"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "abc000"
        @user.password_confirmation = "abc000"
        expect(@user).to be_valid
      end
    end
    
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        anoter_user = FactoryBot.build(:user)
        anoter_user.email = @user.email
        anoter_user.valid?
        expect(anoter_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに＠が抜けては登録できない" do
        @user.email = 'ii'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが６文字以上でないと登録できない" do
        @user.password = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが数字のみでは登録できない" do
        @user.password = "123456"
        @user.valid?
        
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが英字のみでは登録できない" do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空だと保存できないこと' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name is invalid")
      end
      it 'family_nameが全角でないと保存できないこと' do
        @user.family_name = "abe"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it 'nameが空だと保存できないこと' do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank", "Name is invalid")
      end
      it 'family_name_kanaが空だと保存できないこと' do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank", "Family name kana is invalid")
      end
      it 'family_name_kanaが全角でないと保存できないこと' do
        @user.family_name_kana = "abe"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it 'name_kanaが空だと保存できないこと' do
        @user.name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana can't be blank", "Name kana is invalid")
      end
      it 'name_kanaが全角でないと保存できないこと' do
        @user.name_kana = "abe"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana is invalid")
      end
      it 'birth_dateが空だと保存できないこと' do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end

