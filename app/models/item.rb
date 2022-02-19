class Item < ApplicationRecord
  #空の投稿を保存できないようにする

  #ジャンルの選択が「--」の時は保存できないようにする
  belongs_to :user
  has_one_attached :image
  # has_one :purchase_record
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category_id
  belongs_to :item_sales_status_id
  belongs_to :item_shipping_fee_status_id
  belongs_to :item_prefecture_id
  belongs_to :item_scheduled_delivery_id
  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :item_category_id, numericality: { other_than: 1 }
  validates :item_sales_status_id, numericality: { other_than: 1 }
  validates :item_shipping_fee_status_id, numericality: { other_than: 1 }
  validates :item_prefecture_id, numericality: { other_than: 1 }
  validates :item_scheduled_delivery_id, numericality: { other_than: 1 }
  validates :item_price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

end
