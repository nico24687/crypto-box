class AddCategoryIdToCyptocurrencies < ActiveRecord::Migration[5.1]
  def change
    add_reference :cryptocurrencies, :category, foreign_key: true
  end
end
