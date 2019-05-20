class FoodsController < ApplicationController
  # before_action :set_food, only: [:show, :edit, :update, :destroy]
  
  def food_params
        params.require(:food).permit(:name, :price, :tags)
    end

  # # GET /foods
  # # GET /foods.json
  # def index
  #   @foods = Food.all
  # end
  
  def rate
    @food = Food.find(params[:id])
    @restaurant = Restaurant.find(@food.restaurant_id)
    if session[:user_id] == @restaurant.user_id
      flash[:notice] = "You cannot rate your own food, sorry."
      redirect_to restaurant_path(@restaurant) and return
    end
    
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
  end

  def new
      # default: render 'new' template
      restaurant = Restaurant.find(params[:restaurant_id])
      if session[:user_id] != restaurant.user_id
          flash[:notice] = "You do not have permission to add foods to '#{restaurant.name}'"
          redirect_to restaurant_path(restaurant) and return
      end
      @restaurant_id = params[:restaurant_id]
  end
  
  def create
      restaurant = Restaurant.find(params[:restaurant_id].keys[0].to_i)
      if session[:user_id] != restaurant.user_id
          flash[:notice] = "You do not have permission to add foods to '#{restaurant.name}'"
          redirect_to restaurant_path(restaurant) and return
      end
      @food = Food.create!(food_params)
      # puts params
      # puts "aaaaaaa"
      # puts params[:restaurant_id].keys[0]
      @food.update_attributes(restaurant_id: params[:restaurant_id].keys[0].to_i, rating: 0, number_of_ratings: 0)
      flash[:notice] = "#{@food.name} was successfully created."
      # restaurant = Restaurant.find(@food.restaurant_id)
      redirect_to restaurant_path(@food.restaurant) and return
  end
  
  def edit
      @food = Food.find params[:id]
      restaurant = Restaurant.find(@food.restaurant_id)
      if session[:user_id] != restaurant.user_id
          flash[:notice] = "You do not have permission to edit '#{@food.name}'"
          redirect_to restaurant_path(restaurant) and return
      end
  end
  
  def update
      @food = Food.find params[:id]
      @food.update_attributes!(food_params)
      flash[:notice] = "#{@food.name} was successfully updated."
      redirect_to restaurant_path(@food.restaurant)
  end
  
  def destroy
      @food = Food.find(params[:id])
      restaurant = Restaurant.find(@food.restaurant_id)
      if session[:user_id] != restaurant.user_id
        flash[:notice] = "You do not have permission to delete '#{@food.name}'"
        redirect_to restaurant_path(restaurant) and return
      end
      name = @food.name
      @food.destroy
      flash[:notice] = "Food '#{name}' deleted."
      redirect_to restaurant_path(restaurant) and return
  end
end
