class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :password, format: { with: /\A[a-zA-Z0-9]+\z/}
         
         with_options presence: true do
         validates :nickname
         validates :password, format: { with: /\A[a-zA-Z0-9]+\z/}
         validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
         validates :name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
         validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :birth_date, presence: true
         end
         
         has_many :items
         has_many :orders
end
