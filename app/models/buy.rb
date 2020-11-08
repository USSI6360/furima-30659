class Buy 
  include ActiveModel::Model
  attr_accessor :yubin,:prefecture_id,:municipality,:number,:building,:tell,:user_id,:item_id,:token
  
  with_options presence: true do
  validates :token 
  validates :yubin, format: { with: /\A\d{3}[-]\d{4}\z/}
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :municipality,format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :number
  validates :tell, format: { with: /\A\d{11}\z/}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(yubin: yubin, prefecture_id: prefecture_id, municipality: municipality, number: number,building: building,tell: tell,order_id: order.id)
   
  end
end