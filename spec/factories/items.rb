FactoryBot.define do
  factory :item do
    item_name {"商品の名前"}
    item_info {"商品の説明"}
    item_category_id {3}
    item_sales_status_id {3}
    item_shipping_fee_status_id {3}
    item_prefecture_id {3}
    item_scheduled_delivery_id {3}
    item_price {300}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
 end
end