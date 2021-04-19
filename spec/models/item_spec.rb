require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do

  context '新規で商品出品ができるとき' do
   it 'productとdescription、category_id、condition_id、ship_basa_id、ship_date_id、prefecture_id、price、imageが存在していれば保存できること' do
     expect(@item).to be_valid
   end
  end


 context '新規で商品出品ができない' do
  it 'productが空では登録できない' do
    @item.product = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Product can't be blank")
  end

  it 'descriptionが空では登録できない' do
    @item.description = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Description can't be blank")
  end

  it 'category_idが1では登録できない' do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Category must be other than 1")
  end

  it 'condition_idが1では登録できない' do
    @item.condition_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition must be other than 1")
  end
  
  it 'ship_basa_idが1では登録できない' do
    @item.ship_base_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Ship base must be other than 1")
  end

  it 'ship_date_idが1では登録できない' do
    @item.ship_date_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Ship date must be other than 1")
  end
   
  it 'prefecture_idが1では登録できない' do
    @item.prefecture_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
  end

  it 'priceが空だと登録できない' do
    @item.price = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end

  it 'priceが全角数字だと登録できない' do
    @item.price ='１０００'
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is not a number")
  end


  it 'imageが空では登録できない' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end
    

  it 'userが紐付いていないと保存できないこと' do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('User must exist')
  end
  end
 end
end
