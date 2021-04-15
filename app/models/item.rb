class Item < ApplicationRecord

  with_options presence: true do
   validates :product
   validates :description
   validates :category_id
   validates :condition_id
   validates :ship_base_id
   validates :ship_date_id
   validates :prefecture_id
   validates :price
   validates :user, foreign_key: true
  end


  has_one :order
  belongs_to :user
end
