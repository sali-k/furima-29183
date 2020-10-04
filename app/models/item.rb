class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :purchase
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :handing_time

  with_options presence: true do
    validates :images
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :category_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :condition_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :postage_payer_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :handing_time_id, numericality: { other_than: 0, message: 'を選択してください' }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  end
end
