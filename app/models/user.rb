class User < ActiveRecord::Base
  has_secure_password

  validates :username, uniqueness: true
  validates :first_name, :last_name, :username, :password, presence: true

  has_many :active_carts, -> { where "order_id = false" }, class_name: "Cart"
  has_many :ordered_carts, -> { where "order_id = true" }, class_name: "Cart"
  has_many :products_in_cart, through: :active_carts, class_name: "CartProduct"
  has_many :products_ordered, through: :ordered_carts, class_name: "CartProduct"
  has_many :addresses
  has_many :financial_informations

end
