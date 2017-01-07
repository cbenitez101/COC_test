class MenuController < ApplicationController
  def index
  	@dishes = Dish.active()
  end
end
