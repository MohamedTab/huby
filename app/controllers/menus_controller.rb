class MenusController < ApplicationController

  def show

  end

  def new

  end
  def create

    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu = @restaurant.menus.new(menu_params)




    @menu.save


    redirect_to restaurants_path
  end

  private

    def menu_params
      params.require(:menu).permit(:restaurant_id)
    end
end

