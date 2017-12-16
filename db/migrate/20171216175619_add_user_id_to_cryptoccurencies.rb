class AddUserIdToCryptoccurencies < ActiveRecord::Migration[5.1]
  def change
    add_reference :cryptocurrencies, :user, foreign_key: true
  end
end
