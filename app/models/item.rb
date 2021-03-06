class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :prefecture
  belongs_to :ship_base
  belongs_to :ship_date

  has_one_attached :image
  has_one :order
  belongs_to :user

  with_options presence: true do
   validates :product
   validates :description
   validates :price, numericality: { :greater_than_or_equal_to => 300 , :less_than_or_equal_to => 9999999 } , format: {with: /\A[0-9]+\z/i }
   validates :image
  end

  with_options numericality: { other_than: 1 }, presence: true do
   validates :category_id 
   validates :condition_id 
   validates :prefecture_id 
   validates :ship_base_id 
   validates :ship_date_id 
  end

end
