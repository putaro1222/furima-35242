class OrderAddress 
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id


  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :block
    validates :phone_number, format: {with: /\A[0-9]{10}\z/}
   end

   validates :building, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }

   def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number)
  end

end