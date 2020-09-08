FactoryBot.define do
  factory :item do
    name                { '商品名' }
    description         { '商品の説明' }
    category_id         { 1 }
    condition_id        { 1 }
    postage_payer_id    { 1 }
    prefecture_id       { 1 }
    handing_time_id     { 1 }
    price               { 1000 }
  end
end
