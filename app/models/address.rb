class Address < ApplicationRecord
  belongs_to :purchase
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は「-」を含めて入力してください' }
    validates :prefectures_id
    validates :city 
    validates :home_number
    validates :phone_number, format: { with: /\A\d{11}\z/ , message: 'は「-」を除いて入力してください' }
    validates :purchase
  end
end
