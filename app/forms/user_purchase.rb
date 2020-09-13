class UserPurchase

  include ActiveModel::Model
  attr_accessor :description, :price, :image, :post_code, :prefectures_id, :city, :home_number, :building_name, :phone_number, :name_reading, :purchase
end