require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品登録ができる時' do
    it '商品画像と商品名、商品の説明とカテゴリーの情報が存在すれば登録できる' do
    end
  end

  it '全ての項目が入力されていれば出品できる' do
    @item.valid?
    expect(@item).to be_valid
  end

  context '商品登録ができない時' do
    it '商品画像が空では出品出来ない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が空だと保存できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it '商品の説明が空だと保存できない' do
      @item.item_info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item info can't be blank")
    end

    it '商品のカテゴリーの情報が空だと保存できない' do
      @item.item_category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Item category must be other than 1")
    end

    it '商品の状態の情報が空だと保存できない' do
      @item.item_sales_status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Item sales status must be other than 1")
    end

    it '配送料の負担の情報が空だと保存できないこと' do
      @item.item_shipping_fee_status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Item shipping fee status must be other than 1")
    end

    it '発送元の地域の情報が空だと保存できないこと' do
      @item.item_prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Item prefecture must be other than 1")
    end

    it '発送までの日数の情報が空だと保存できないこと' do
      @item.item_scheduled_delivery_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Item scheduled delivery must be other than 1")
    end

    it 'priceが300円未満では保存できないこと' do
      @item.item_price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
    end

    it 'priceが9,999,999円を超過すると保存できないこと' do
      @item.item_price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include('Item price must be less than or equal to 9999999')
    end

    it 'priceが全角数字だと保存できないこと' do
      @item.item_price = '２０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Item price is not a number')
    end

    it 'priceが空だと保存できないこと' do
      @item.item_price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item price is not a number")
    end
  end
end