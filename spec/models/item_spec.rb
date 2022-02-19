RSpec.describe User, type: :model do
  before do
    @donation_address = FactoryBot.build(:donation)
  end

it '商品名が空だと保存できない' do
  @donation_address.item_name = ''
  @donation_address.valid?
  expect(@donation_address.errors.full_messages).to include("Item name can't be blank")
end

it '商品の説明が空だと保存できない' do
  @donation_address.item_info = ''
  @donation_address.valid?
  expect(@donation_address.errors.full_messages).to include("Item info can't be blank")
end

it '商品のカテゴリーの情報が空だと保存できない' do
  @donation_address.item_category_id = '---'
  @donation_address.valid?
  expect(@donation_address.errors.full_messages).to include("Item category id can't be blank")
end

it '商品の状態の情報が空だと保存できない' do
  @donation_address.item_sales_status_id = '---'
  @donation_address.valid?
  expect(@donation_address.errors.full_messages).to include("Item sales status can't be blank")
end

it '配送料の負担の情報が空だと保存できないこと' do
  @donation_address.item_shipping_fee_status_id = '---'
  @donation_address.valid?
  expect(@donation_address.errors.full_messages).to include('Item shipping fee status is invalid')
end

it '発送元の地域の情報が空だと保存できないこと' do
  @donation_address.item_prefecture_id = '---'
  @donation_address.valid?
  expect(@donation_address.errors.full_messages).to include('Item prefecture is invalid')
end

it '発送までの日数の情報が空だと保存できないこと' do
  @donation_address.item_scheduled_delivery_id = '---'
  @donation_address.valid?
  expect(@donation_address.errors.full_messages).to include('Item scheduled delivery is invalid')
end

it 'priceが300円未満では保存できないこと' do
  @donation_address.price = 299
  @donation_address.valid?
  expect(@donation_address.errors.full_messages).to include('Price is invalid')
end

it 'priceが9,999,999円を超過すると保存できないこと' do
  @donation_address.price = 10000000
  @donation_address.valid?
  expect(@donation_address.errors.full_messages).to include('Price is invalid')
end

it 'priceが全角数字だと保存できないこと' do
  @donation_address.price = '２０００'
  @donation_address.valid?
  expect(@donation_address.errors.full_messages).to include('Price is invalid')
end

it 'priceが空だと保存できないこと' do
  @donation_address.price = ''
  @donation_address.valid?
  expect(@donation_address.errors.full_messages).to include('Price is invalid')
end

it '全ての項目が入力されていれば出品できる' do
  @donation_address.price = ''
  @donation_address.valid?
  expect(@donation_address.errors.full_messages).to include('Price is invalid')
end
