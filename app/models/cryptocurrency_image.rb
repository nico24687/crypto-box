class CryptocurrencyImage < ApplicationRecord 
  belongs_to :image
  belongs_to :cryptocurrency
end