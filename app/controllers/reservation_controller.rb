class ReservationController < ApplicationController
  def index
  	@restaurantsprov = Restaurant.all.group('provincia')
  	@restaurantsloc = Restaurant.all.group('localidad')
  	@restaurantsname = Restaurant.all.group('name')
  end
  def create
  	
  end
end
