FactoryBot.define do
  factory :purchase_shipping do
    postal_code_id { '123-4567' }
    item_prefecture_id { 1 }
    city { "札幌市" }
    addresses { "札幌1-1-1" }
    building {}
    phone_number { "09000000000" }
    token {"tok_abcdefghijk00000000000000000"}
    
  end
end
