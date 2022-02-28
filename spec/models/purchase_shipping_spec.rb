require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  describe '寄付情報の保存' do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      @purchase_shipping.valid?
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
        expect(@purchase_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it 'postal_code_idが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_shipping.postal_code_id = '1234567'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it 'item_prefecture_idを選択していないと保存できないこと' do
      @purchase_shipping.item_prefecture_id = 0
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item prefecture can't be blank")
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

    it 'user_idが空では登録できないこと' do
      @purchase_shipping.user_id = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空では登録できないこと' do
      @purchase_shipping.item_id = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
    end

    it 'userが紐付いていなければ登録できない' do
      @purchase_shipping.user_id = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが紐付いていなければ登録できない' do
      @purchase_shipping.item_id = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Item can't be blank")
    end

    it 'tokenが空では登録できない' do
      @purchase_shipping.token = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Token can't be blank")
    end

    it '電話番号は半角数値でなければ登録できない' do
      @purchase_shipping.phone_number = '123'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号は9桁以下では登録できないこと' do
      @purchase_shipping.phone_number = '123456789'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号は12桁以上では登録できないこと' do
      @purchase_shipping.phone_number = '123456789012'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Phone number can't be blank")
    end
  end
end
  pending "add some examples to (or delete) #{__FILE__}"
end
