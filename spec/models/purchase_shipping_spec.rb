require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  describe '寄付情報の保存' do
  before do
    user = FactoryBot.create(:user)
    @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id)
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_shipping).to be_valid
    end

    it 'buildingは空でも保存できること' do
      @purchase_shipping.building = ''
        expect(@purchase_shipping).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'postal_code_idが空だと保存できないこと' do
      @purchase_shipping.postal_code_id = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code id can't be blank")
    end

    it 'postal_code_idが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_shipping.postal_code_id = '1234567'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include('Postal code id is invalid. Include hyphen(-)')
    end

    it 'item_prefecture_idを選択していないと保存できないこと' do
      @purchase_shipping.item_prefecture_id = 0
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item prefecture id can't be blank")
    end

    it 'cityが空だと保存できないこと' do
      @purchase_shipping.city = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
    end

    it 'addressesが空だと保存できないこと' do
      @purchase_shipping.addresses = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Addresses can't be blank")
    end

    it 'phone_numberが空だと保存できないこと' do
      @purchase_shipping.phone_number = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが半角数値で正しい形式でないと保存できないこと' do
      @purchase_shipping.phone_number = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
    end

    # it 'priceが空だと保存できないこと' do
    end
    # it 'priceが全角数字だと保存できないこと' do
    end
    # it 'priceが1円未満では保存できないこと' do
    end
    # it 'priceが1,000,000円を超過すると保存できないこと' do
    end
    # it 'userが紐付いていないと保存できないこと' do
    end

  end
end
  pending "add some examples to (or delete) #{__FILE__}"
end
