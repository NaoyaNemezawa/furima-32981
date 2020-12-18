require 'rails_helper'

RSpec.describe User, type: :model do
  before do
  end

  describe "ユーザー新規登録" do
    context "新規登録がうまく行く時" do
      it "必要な情報がすべてあれば登録できること" do
      end

      it "passwordが英数混合6文字以上あれば登録できる" do
      end

      it "last_nameが全角入力であれば登録できる" do
      end

      it "first_nameが全角入力であれば登録できる" do
      end

      it "last_name_readが全角カナ入力であれば登録できる" do
      end

      it "first_name_readが全角カナ入力であれば登録できる" do
      end

    context "新規登録がうまくいかないとき" do
      it "nicknameが空だと登録できない" do
      end

      it "emailが空だと登録できない" do
      end

      it "重複したemailが存在すると登録できない" do
      end

      it "emailに@がないと登録できない" do
      end

      it "passwordが空だと登録できない" do
      end

      it "passwordが６文字以下だと登録できない" do
      end

      it "passwordが半角数字だけでは登録できない" do
      end

      it "passwordが半角英字だけでは登録できない" do
      end

      it "passwordに全角文字を含むと登録できない" do
      end

      it "passwordとpassword_confirmationが一致しないと登録できない" do
      end

      it "last_nameが半角だと登録できない" do
      end

      it "first_nameが半角だと登録できない" do
      end

      it "last_name_readが半角だと登録できない" do
      end

      it "first_name_readが半角だと登録できない" do
      end

      it "last_name_readがひらがなだと登録できない" do
      end

      it "first_name_readがひらがなだと登録できない" do
      end

      it "last_name_readが漢字だと登録できない" do
      end

      it "first_name_readが漢字だと登録できない" do
      end

      it "生年月日が空だと登録できない" do
      end
    end
  end
end
