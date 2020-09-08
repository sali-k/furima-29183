FactoryBot.define do
  factory :item do
    association :user
    name                { '商品名' }
    description         { '商品の説明' }
    category_id         { 2 }
    condition_id        { 2 }
    postage_payer_id    { 2 }
    prefecture_id       { 2 }
    handing_time_id     { 2 }
    price               { 1000 }
  end
end
