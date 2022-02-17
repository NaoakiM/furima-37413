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