class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :order
  belongs_to :user 
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days
  

  with_options presence: true do
    validates :category,:status,:burden,:prefecture,:days, :price, :product_name, :image, :instructions, presence: true
    validates :category_id,:status_id,:burden_id,:prefecture_id, :days_id,numericality: { other_than: 0 }
  
    validates :price, numericality: { with:/\A[0-9]+\z/, greater_than: 299,less_than: 10000000 }
  end
end

