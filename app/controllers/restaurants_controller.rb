class RestaurantsController < ApplicationController
    
    def restaurant_params
        params.require(:restaurant).permit(:name, :address, :phone_number, :description)
    end
    
    def show
    id = params[:id]
    @restaurant = Restaurant.find(id)
    end
    
    def index
        @restaurants = Restaurant.all
    end
    
    def new
        # default: render 'new' template
    end
    
    def create
        @restaurant = Restaurant.create!(restaurant_params)
        flash[:notice] = "#{@restaurant.name} was successfully created."
        redirect_to restaurant_path(@restaurant)
    end
    
    def edit
        @restaurant = Restaurant.find params[:id]
    end
    
    def update
        @restaurant = Restaurant.find params[:id]
        @restaurant.update_attributes!(restaurant_params)
        flash[:notice] = "#{@restaurant.name} was successfully updated."
        redirect_to restaurant_path(@restaurant)
    end
    
    def destroy
        @restaurant = Restaurant.find(params[:id])
        @restaurant.destroy
        flash[:notice] = "Restaurant '#{@resturant.name}' deleted."
        redirect_to restaurants_path
    end
end
