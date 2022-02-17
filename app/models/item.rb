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

end
