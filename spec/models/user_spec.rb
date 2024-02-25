require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "gender_idが空では登録できない" do
        @user.gender_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Gender must be selected")
      end
      it "ageが空では登録できない" do
        @user.age = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Age can't be blank")
      end
      it "occupation_idが空では登録できない" do
        @user.occupation_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Occupation must be selected")
      end
      it "family_idが空では登録できない" do
        @user.family_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family must be selected")
      end
    end
  end
end
