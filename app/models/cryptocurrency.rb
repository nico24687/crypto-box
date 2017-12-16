class Cryptocurrency < ApplicationRecord
  validates :name, presence: true 
  validates :amount, numericality: { greater_than: 0 }
  belongs_to :user 
  belongs_to :category
  has_many :cryptocurrency_images
  has_many :images, through: :cryptocurrency_images
end
