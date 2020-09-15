class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :post_code, :prefectures_id, :city, :home_number, :building_name, :phone_number, :purchase_id

  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'は「-」を含めて入力してください' }
    validates :prefectures_id
    validates :city 
    validates :home_number
    validates :phone_number, format: { with: /\A\d{11}\z/ , message: 'は「-」を除いて11桁以内で入力してください' }
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefectures_id: prefectures_id, city: city, home_number: home_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end