class Item < ApplicationRecord
  #空の投稿を保存できないようにする
  validates :title, :text, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :genre_id, numericality: { other_than: 1 } 

  validates :item_image, presence: true
  validates :item_name, presence: true
  validates :item_explanation, presence: true
  validates :item_category, presence: true
  validates :item_situation, presence: true
  validates :item_delivery_charge, presence: true
  validates :item_shipment_source, presence: true
  validates :item_date_of_shipment, presence: true
  validates :item_price, presence: true

  価格は、¥300~¥9,999,999の間のみ保存可能であること。

  価格は半角数値のみ保存可能であること。
  it 'passwordに全角文字が含む場合登録できない' do
    @user.password = 'abc123'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
end
