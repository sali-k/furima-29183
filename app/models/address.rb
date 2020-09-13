class Address < ApplicationRecord
  belongs_to :purchase
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :post_code
    validates :prefectures_id
    validates :city 
    validates :home_number
    validates :phone_number
    validates :purchase 
  end
end
