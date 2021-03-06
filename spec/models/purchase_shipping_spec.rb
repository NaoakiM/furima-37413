require 'rails_helper'

RSpec.describe PurchaseShipping, type: :model do
  
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  describe '購入情報の保存' do
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
        expect(@purchase_shipping.errors.full_messages).to include("郵便番号を入力してください")
    end

    it 'postal_code_idが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_shipping.postal_code_id = '1234567'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("郵便番号は不正な値です")
    end

    it 'item_prefecture_idを選択していないと保存できないこと' do
      @purchase_shipping.item_prefecture_id = 0
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include()
    end

    it 'cityが空だと保存できないこと' do
      @purchase_shipping.city = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("市区町村を入力してください")
    end

    it 'addressesが空だと保存できないこと' do
      @purchase_shipping.addresses = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("番地を入力してください")
    end

    it 'phone_numberが空だと保存できないこと' do
      @purchase_shipping.phone_number = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("電話番号を入力してください")
    end

    it 'phone_numberが半角数値以外が入力されている場合' do
      @purchase_shipping.phone_number = '１２３４５６７８９０'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("電話番号は不正な値です")
    end

    it 'user_idが空では登録できないこと' do
      @purchase_shipping.user_id = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Userを入力してください")
    end

    it 'item_idが空では登録できないこと' do
      @purchase_shipping.item_id = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("Itemを入力してください")
    end

    it 'tokenが空では登録できない' do
      @purchase_shipping.token = ''
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("トークンを入力してください")
    end

    it '電話番号は9桁以下では登録できないこと' do
      @purchase_shipping.phone_number = '123456789'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("電話番号は不正な値です")
    end

    it '電話番号は12桁以上では登録できないこと' do
      @purchase_shipping.phone_number = '123456789012'
        @purchase_shipping.valid?
        expect(@purchase_shipping.errors.full_messages).to include("電話番号は不正な値です")
    end
  end
end
  pending "add some examples to (or delete) #{__FILE__}"
end
