class Food < ActiveRecord::Base
    has_many :ratings
    belongs_to :restaurant
end
