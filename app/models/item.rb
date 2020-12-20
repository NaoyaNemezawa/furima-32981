class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image,:name,:description,:category_id,:state_id,:postage_charge_id,:prefecture_id,:shipment_date_id, presence: true
  validates :price, numericality: {only_integer: true,greater_than: 299,less_than: 10000000}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category,:state,:postage_charge,:prefecture,:shipment_date
end
