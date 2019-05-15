class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

    def rating_params
        params.require(:rating).permit(:score, :user_id, :food_id)
    end

  def new
  end

  # def edit
  # end

  def create
    food = Food.find(params[:food_id].keys[0].to_i)
    @restaurant = Restaurant.find(food.restaurant_id)
    if session[:user_id] == @restaurant.user_id
      redirect_to restaurant_path(@restaurant) and return
    end
    params[:rating][:food_id] = params[:food_id].keys[0].to_i
    params[:rating][:user_id] = session[:user_id]
    @rating = Rating.new(rating_params)
    update_rating_accum(food.id, @rating.score)
    flash[:notice] = "You successfully gave '#{food.name}' a rating of '#{@rating.score}'"
    redirect_to restaurant_path(@restaurant) and return
  end

  # def update
  # end

  # def destroy
  # end
  
  def update_rating_accum(food_id, rating_score)
      food = Food.find(food_id)
      current_rating = food.rating
      number_of_ratings = food.number_of_ratings
      total_rating_score = current_rating * number_of_ratings
      total_rating_score = total_rating_score + rating_score
      number_of_ratings = number_of_ratings + 1
      new_rating = total_rating_score / number_of_ratings
      food.update_attributes(rating: new_rating, number_of_ratings: number_of_ratings)
  end
end
