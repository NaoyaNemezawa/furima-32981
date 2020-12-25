class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :image, :name, :description, presence: true
  validates :category_id, :state_id, :postage_charge_id, :prefecture_id, :shipment_date_id, numericality: { other_than: 1 }
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :postage_charge
  belongs_to :prefecture
  belongs_to :shipment_date
end
