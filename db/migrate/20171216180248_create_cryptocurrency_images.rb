class CreateCryptocurrencyImages < ActiveRecord::Migration[5.1]
  def change
    create_table :cryptocurrency_images do |t|
      t.references :cryptocurrency, foreign_key: true
      t.references :image, foreign_key: true
    end
  end
end
