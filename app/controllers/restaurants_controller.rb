class RestaurantsController < ApplicationController
    
    def restaurant_params
        params.require(:restaurant).permit(:name, :address, :phone_number, :description)
    end
    
    def show
        id = params[:id]
        @restaurant = Restaurant.find(id)
        @foods = Food.where(restaurant_id: id)
    end
    
    def index
        @restaurants = Restaurant.all
    end
    
    def new
        # default: render 'new' template
    end
    
    def create
        @restaurant = Restaurant.create!(restaurant_params)
        @restaurant.update_attributes(user_id: session[:user_id])
        flash[:notice] = "#{@restaurant.name} was successfully created."
        redirect_to restaurant_path(@restaurant)
    end
    
    def edit
        @restaurant = Restaurant.find params[:id]
        if session[:user_id] != @restaurant.user_id
            flash[:notice] = "You do not have permission to modify '#{@restaurant.name}'"
            redirect_to restaurant_path(@restaurant) and return
        end
    end
    
    def update
        @restaurant = Restaurant.find params[:id]
        @restaurant.update_attributes!(restaurant_params)
        flash[:notice] = "#{@restaurant.name} was successfully updated."
        redirect_to restaurant_path(@restaurant)
    end
    
    def destroy
        @restaurant = Restaurant.find(params[:id])
        if session[:user_id] != @restaurant.user_id
            flash[:notice] = "You do not have permission to delete '#{@restaurant.name}'"
            redirect_to restaurant_path(@restaurant) and return
        end
        @restaurant.destroy
        flash[:notice] = "Restaurant '#{@restaurant.name}' deleted."
        redirect_to restaurants_path
    end
end
