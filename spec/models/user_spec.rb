require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

  describe 'ユーザー新規登録' do

   context '新規登録できるとき' do
    it 'nicknameとemail、passwordとpassword_confirmationm、last_nameとfirst_name、 last_name_kanaとfirst_name_kana、birthdayが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'passwordが6文字以上であれば登録できる' do
      @user.password = '12345a'
      @user.password_confirmation = '12345a'
      expect(@user).to be_valid
    end
   end



  context '新規登録できないとき' do
    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")

    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")

    end

    it 'passwordとpassword_confirmationが一致していないと登録できない' do
      @user.password = '12345a'
      @user.password_confirmation = '12345ab'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include ('Email has already been taken')
    end

    it 'emailに＠がないと登録できないこと' do
      @user.email = 'test1.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')

    end
    
    it 'passwordが5文字以下では登録できない' do
      @user.password ='1234a'
      @user.password_confirmation = '1234a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが全角英数字だと登録できない' do
      @user.password ='１２３４５B'
      @user.password_confirmation = '１２３４５B'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが半角英数字混合ではないと登録できない(数字のみ)' do
      @user.password ='123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    
    it 'passwordが半角英数字混合ではないと登録できない(英字のみ)' do
      @user.password ='abcdefg'
      @user.password_confirmation = 'abcdefg'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'last_nameが全角文字でなければ登録できない' do
      @user.last_name ='TEST'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it 'first_nameが全角文字でなければ登録できない' do
      @user.first_name ='TESTA'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it 'last_name_kanaが全角カタカナでなければ登録できない' do
      @user.last_name_kana ='あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it 'first_name_kanaが全角カタカナ文字でなければ登録できない' do
      @user.first_name_kana ='かきくけこ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    
    it 'last_name_kanaが半角カタカナだと登録できない' do
      @user.last_name_kana ='ｱｲｳｴｵ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it 'first_name_kanaが半角カタカナ文字だと登録できない' do
      @user.first_name_kana ='ｶｷｸｹｺ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

   end
  end
end
