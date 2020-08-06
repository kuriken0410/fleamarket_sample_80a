class Product < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :category
  has_many :products
end
