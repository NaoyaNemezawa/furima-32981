require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品の購入' do
    context '商品の購入がうまくいくとき' do
      it '必要な情報が全てあれば商品を購入できる' do
        expect(@order_address).to be_valid
      end

      it '建物名が空でも商品を購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end

      it '１０桁の電話番号でも商品を購入できる' do
        @order_address.tel = Faker::Number.number(digits: 10)
        expect(@order_address).to be_valid
      end
    end

    context '商品の購入がうまくいかないとき' do
      it 'トークンが発行されなければ商品は購入できない' do
        @order_address.token = ''
        @order_address.valid?
        # binding.pry
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空だと商品は購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        # binding.pry
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンがないと商品は購入できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end

      it '配送先の都道府県が1だと商品は購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it '配送先の市区町村が空だと商品は購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it '配送先の番地が空だと商品は購入できない' do
        @order_address.number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Number can't be blank")
      end

      it '電話番号が空だと商品は購入できない' do
        @order_address.tel = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel can't be blank")
      end

      it '9桁の電話番号だと商品は購入できない' do
        @order_address.tel = Faker::Number.number(digits: 9)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is invalid')
      end

      it '電話番号にハイフンがあると商品は購入できない' do
        @order_address.tel = 1234 - 56_789
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tel is invalid')
      end

      it "user_idが空だと商品は購入できない" do
        @order_address.user_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空だと商品は購入できない" do
        @order_address.item_id = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
