FactoryBot.define do
  factory :item do
    name {'トランプ'}
    detail {'カードゲーム'}
    category_id {2}
    condition_id {2}
    send_cost_id {2}
    prefecture_id {2}
    send_day_id {2}
    price {1200}
    user_id {2}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end