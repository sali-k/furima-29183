class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :post_code, :prefectures_id, :city, :home_number, :building_name, :phone_number, :purchase_id

  with_options presence: true do
    validates :token
    validates :post_code
    validates :prefectures_id, numericality: { other_than: 0 }
    validates :city
    validates :home_number
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'は「-」を除いて11桁以内で入力してください' }
  end

  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  validates_format_of :post_code, with: POSTAL_CODE_REGEX, message: 'は「-」を含めて入力してください' 

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefectures_id: prefectures_id, city: city, home_number: home_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
