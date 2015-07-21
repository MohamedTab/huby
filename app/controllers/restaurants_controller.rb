class RestaurantsController < ApplicationController
before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    if params[:locality]
      @restaurants = Restaurant.search(params[:locality])
    else
      @restaurants = Restaurant.order("created_at DESC")
    end

    # Let's DYNAMICALLY build the markers for the view.
    @markers = Gmaps4rails.build_markers(@restaurants) do |restaurant, marker|
      marker.lat restaurant.latitude
      marker.lng restaurant.longitude
    end

    @reviews = Review.all

  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @menu = Menu.new


  end

  def new
    @restaurant = Restaurant.new
     3.times { @restaurant.restaurant_pictures.build }
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user_id = current_user.id
    @restaurant.save
    # Unless @restaurant.valid?, #save will return false,
    # and @restaurant is not persisted.
    # TODO: present the form again with error messages.
    redirect_to restaurant_path(@restaurant)
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)

    # no need for app/views/restaurants/update.html.erb
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to restaurants_path
  end

  private

  def restaurant_params
      params.require(:restaurant).permit(:name, :description, :seat, :number_phone, :address, :route, :country, :street_number, :locality, restaurant_pictures_attributes: [:picture])
  end

   def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
