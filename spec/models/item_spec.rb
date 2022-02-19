RSpec.describe User, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  it '商品画像が空では出品出来ない' do
    @item.item_image = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Item image can't be blank")
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
  expect(@item.errors.full_messages).to include("Item category id can't be blank")
end

it '商品の状態の情報が空だと保存できない' do
  @item.item_sales_status_id = '1'
  @item.valid?
  expect(@item.errors.full_messages).to include("Item sales status can't be blank")
end

it '配送料の負担の情報が空だと保存できないこと' do
  @item.item_shipping_fee_status_id = '1'
  @item.valid?
  expect(@item.errors.full_messages).to include('Item shipping fee status is invalid')
end

it '発送元の地域の情報が空だと保存できないこと' do
  @item.item_prefecture_id = '1'
  @item.valid?
  expect(@item.errors.full_messages).to include('Item prefecture is invalid')
end

it '発送までの日数の情報が空だと保存できないこと' do
  @item.item_scheduled_delivery_id = '1'
  @item.valid?
  expect(@item.errors.full_messages).to include('Item scheduled delivery is invalid')
end

it 'priceが300円未満では保存できないこと' do
  @item.price = 299
  @item.valid?
  expect(@item.errors.full_messages).to include('Price is invalid')
end

it 'priceが9,999,999円を超過すると保存できないこと' do
  @item.price = 10000000
  @item.valid?
  expect(@item.errors.full_messages).to include('Price is invalid')
end

it 'priceが全角数字だと保存できないこと' do
  @item.price = '２０００'
  @item.valid?
  expect(@item.errors.full_messages).to include('Price is invalid')
end

it 'priceが空だと保存できないこと' do
  @item.price = ''
  @item.valid?
  expect(@item.errors.full_messages).to include('Price is invalid')
end

it '全ての項目が入力されていれば出品できる' do
  @item.price = ''
  @item.valid?
  expect(@item.errors.full_messages).to include('Price is invalid')
end
