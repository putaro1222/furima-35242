class Order < ApplicationRecord
  belongs_to :item
  has_one :address
  belongs_to :order
end
