require_relative 'house.rb'
require_relative 'road.rb'

ma_maison = House.new(20, 8, "red" )
ta_maison = House.new(25, 12, "green")
ma_route = Road.new(75, 5, "A6", "yellow")

ma_maison.display
ma_route.display
ta_maison.display
