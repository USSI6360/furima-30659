class Buy 
  include ActiveModel::Model
  attr_accessor :order_id,:yubin,:prefecture_id,:municipality,:number,:building,:tell,:user_id,:item_id
  
  #  クレジットカード情報は必須であり、正しいクレジットカードの情報で無いときは決済できないこと
  validates :prefecture_id, numericality: { other_than: 0 }
  #  配送先の情報として、郵便番号・都道府県・市区町村・番地・電話番号が必須であること
  validates :prefecture_id,:municipality,:number, presence: true
  # 郵便番号にはハイフンが必要であること（123-4567となる）
  validates :yubin, format: { with: /\A\d{3}[-]\d{4}\z/}
  # 電話番号にはハイフンは不要で、11桁以内であること（09012345678となる）
  validates :tell, format: { with: /\A\d{11}\z/}
  def save
    binding.pry
    order=Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存

    Address.create(yubin: yubin, prefecture_id: prefecture_id, municipality: municipality, number: number,building: building,tell: tell,order_id: order.id)
   
  end
end