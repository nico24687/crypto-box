class CreateCryptocurrencies < ActiveRecord::Migration[5.1]
  def change
    create_table :cryptocurrencies do |t|
      t.string :name
      t.bigint :amount
      t.string :symbol

      t.timestamps
    end
  end
end
