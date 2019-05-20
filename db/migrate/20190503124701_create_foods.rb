class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :rating
      t.integer :price
      t.string :tags

      t.timestamps null: false
    end
  end
end
