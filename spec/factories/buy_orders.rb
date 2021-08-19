FactoryBot.define do
  factory :buy_order do
    post_num {'123-4567'}
    prefecture_id { 2 }
    city {'札幌市'}
    address {'札幌1-2-3'}
    building {'田中ビル'}
    phone_num {'01234567890'}
    token {"tok_abcdefghijk00000000000000000"}

  end
end
