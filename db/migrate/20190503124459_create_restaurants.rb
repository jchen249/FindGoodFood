class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :description
      t.integer :average_price
      t.integer :average_rating
      t.string :tags

      t.timestamps null: false
    end
  end
end
