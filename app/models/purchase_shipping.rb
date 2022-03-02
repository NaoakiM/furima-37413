class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :postal_code_id, :item_prefecture_id, :city, :addresses, :building, :phone_number, :token, :user_id, :item_id
  with_options presence: true do
      validates :postal_code_id, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
      validates :item_prefecture_id, numericality: {other_than: 1, message: "を入力してください"}
      validates :city
      validates :addresses
      validates :phone_number, format: {with: /\A\d{10,11}\z/}
      validates :user_id
      validates :item_id
      validates :token
  end
  
  def save
    # 寄付情報を保存し、変数donationに代入する
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    ShippingInformation.create(postal_code_id: postal_code_id, item_prefecture_id: item_prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end