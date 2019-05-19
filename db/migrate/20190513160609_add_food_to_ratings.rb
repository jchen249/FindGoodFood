class AddFoodToRatings < ActiveRecord::Migration
  def change
    add_reference :ratings, :food, index: true, foreign_key: true
  end
end
