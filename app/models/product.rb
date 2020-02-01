class Product < ApplicationRecord
  has_many :guarantees, through: :guarantee_products
  has_many :guarantee_products

  validates :name, :value, :photo, presence: true

  mount_uploader :photo, ProductPhotoUploader
end
