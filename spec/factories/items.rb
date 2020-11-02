FactoryBot.define do
  factory :item do
    product_name {"出品商品"}
    instructions {"出品商品説明"}
    category_id {1}
    status_id {1}
    burden_id {1}
    prefecture_id {1}
    days_id {1}
    price {99999}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/test_image.png'), filename: 'test_image.png')
    end
  end
end
