require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @items = FactoryBot.build(:item)
    @items.image = fixture_file_upload('app/assets/images/item-sample.png')
  end

  describe '商品登録機能' do
    context '商品登録がうまく行く時' do
      it '必要な情報が全てあれば商品を登録できる' do
        @items.valid?
      end
    end

    context '商品登録がうまくいかない時' do
      it '商品画像がないと登録できない' do
        @items.image = nil
        @items.valid?
        expect(@items.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空だと登録できない' do
        @items.name = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空だと登録できない' do
        @items.description = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリー情報が1だと登録できない' do
        @items.category_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include('Category must be other than 1')
      end

      it '商品状態の情報が1だと登録できない' do
        @items.state_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include('State must be other than 1')
      end

      it '配送料の負担についての情報が1だと登録できない' do
        @items.postage_charge_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include('Postage charge must be other than 1')
      end

      it '発送元の情報が1だと登録できない' do
        @items.prefecture_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it '発送までの日数の情報が1だと登録できない' do
        @items.shipment_date_id = 1
        @items.valid?
        expect(@items.errors.full_messages).to include('Shipment date must be other than 1')
      end

      it '販売価格がないと登録できない' do
        @items.price = ''
        @items.valid?
        expect(@items.errors.full_messages).to include('Price is not a number')
      end

      it '販売価格が300未満だと登録できない' do
        @items.price = 299
        @items.valid?
        expect(@items.errors.full_messages).to include('Price must be greater than 299')
      end

      it '販売価格が10,000,000以上だと登録できない' do
        @items.price = 10_000_000
        @items.valid?
        expect(@items.errors.full_messages).to include('Price must be less than 10000000')
      end

      it '販売価格に全角数字を入れると保存できない' do
        @items.price = '１２３'
        @items.valid?
        expect(@items.errors.full_messages).to include('Price is not a number')
      end

      it '販売価格は整数のみ保存可能' do
        @items.price = 3.14
        @items.valid?
        expect(@items.errors.full_messages).to include('Price must be an integer')
      end
    end
  end
end
