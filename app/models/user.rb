class User < ActiveRecord::Base
  has_secure_password

  validates :username, uniqueness: true
  validates :title, presence: true
  validates :username, :password, presence: true

  has_many :carts
  has_many :products_in_cart, through: :carts { where order_id: true }, class_name: "CartProducts"
  has_many :products_ordered, through: :carts { where order_id: false }, class_name: "CartProducts"
  has_many :addresses
  has_many :financial_informations


end
