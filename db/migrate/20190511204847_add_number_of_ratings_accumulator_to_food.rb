class AddNumberOfRatingsAccumulatorToFood < ActiveRecord::Migration
  def change
    add_column :foods, :number_of_ratings, :integer
  end
end
