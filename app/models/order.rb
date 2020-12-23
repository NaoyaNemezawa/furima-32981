class Order < ApplicationRecord
  belongs_to :user,:item
end
