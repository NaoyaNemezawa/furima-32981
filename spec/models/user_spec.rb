require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまく行く時' do
      it '必要な情報がすべてあれば登録できること' do
        @user.valid?
      end

      it 'passwordが英数混合6文字以上あれば登録できる' do
        @user.password = 'aiu123'
        @user.password_confirmation = @user.password
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在すると登録できない' do
        @user.save
        user2 = FactoryBot.build(:user)
        user2.email = @user.email
        user2.valid?
        expect(user2.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@がないと登録できない' do
        @user.email.delete!('@')
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが６文字以下だと登録できない' do
        @user.password = 'ab123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角数字だけでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordが半角英字だけでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordに全角文字を含むと登録できない' do
        @user.password = 'あいうえおか'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = '987zyx'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameに半角文字を含むと登録できない' do
        @user.last_name += 'myouzi'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'first_nameに半角文字を含むと登録できない' do
        @user.first_name += 'namae'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'last_name_readに半角文字を含むと登録できない' do
        @user.last_name_read += 'myouzi'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name read is invalid')
      end

      it 'first_name_readに半角文字を含むと登録できない' do
        @user.first_name_read += 'namae'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name read is invalid')
      end

      it 'last_name_readにひらがなを含むと登録できない' do
        @user.last_name_read += 'みょうじ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name read is invalid')
      end

      it 'first_name_readにひらがなを含むと登録できない' do
        @user.first_name_read += 'なまえ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name read is invalid')
      end

      it 'last_name_readに漢字を含むと登録できない' do
        @user.last_name_read += '苗字'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name read is invalid')
      end

      it 'first_name_readに漢字を含むと登録できない' do
        @user.first_name_read += '名前'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name read is invalid')
      end

      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
