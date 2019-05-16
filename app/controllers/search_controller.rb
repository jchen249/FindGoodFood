class SearchController < ApplicationController

  def food
      @food_query = params[:search_bar] || session[:food_query]
      @foods = Food.where("name LIKE ? OR tags LIKE ?", "%#{@food_query}%", "%#{@food_query}%")
  end
  
  def restaurant
      @restaurant_query = params[:search_bar] || session[:restaurant_query]
      @restaurants = Restaurant.where("name LIKE ? OR address LIKE ? OR tags LIKE ? OR description LIKE ?", "%#{@restaurant_query}%", "%#{@restaurant_query}%", "%#{@restaurant_query}%", "%#{@restaurant_query}%")
  end
  
end