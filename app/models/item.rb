class Item < ApplicationRecord
  #空の投稿を保存できないようにする

  #ジャンルの選択が「--」の時は保存できないようにする
   
  has_one_attached :image
  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :item_category_id, numericality: { other_than: 1 }
  validates :item_sales_status_id, numericality: { other_than: 1 }
  validates :item_shipping_fee_status_id, numericality: { other_than: 1 }
  validates :item_prefecture_id, numericality: { other_than: 1 }
  validates :item_scheduled_delivery_id, numericality: { other_than: 1 }
  validates :item_price, presence: true

end
