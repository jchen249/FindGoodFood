class SearchController < ApplicationController

  def food
      @food_query = params[:search_bar] || session[:food_query]
  end
  
  def restaurant
      @restaurant_query = params[:search_bar] || session[:restaurant_query]
      @restaurants = Restaurant.where("name LIKE ?", "%#{@restaurant_query}%")
  end
  
end