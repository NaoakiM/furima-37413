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
      expect(@item.errors.full_messages).to include("Imageを入力してください")
    end

    it 'userが紐付いていなければ登録できないこと' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Userを入力してください")
    end

    it '商品名が空だと保存できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end

    it '商品の説明が空だと保存できない' do
      @item.item_info = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end

    it '商品のカテゴリーの情報が空だと保存できない' do
      @item.item_category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
    end

    it '商品の状態の情報が空だと保存できない' do
      @item.item_sales_status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
    end

    it '配送料の負担の情報が空だと保存できないこと' do
      @item.item_shipping_fee_status_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
    end

    it '発送元の地域の情報が空だと保存できないこと' do
      @item.item_prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域は1以外の値にしてください")
    end

    it '発送までの日数の情報が空だと保存できないこと' do
      @item.item_scheduled_delivery_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
    end

    it 'priceが300円未満では保存できないこと' do
      @item.item_price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
    end

    it 'priceが9,999,999円を超過すると保存できないこと' do
      @item.item_price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
    end

    it 'priceが全角数字だと保存できないこと' do
      @item.item_price = '２０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は数値で入力してください')
    end

    it 'priceが空だと保存できないこと' do
      @item.item_price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("価格は数値で入力してください")
    end
  end
end