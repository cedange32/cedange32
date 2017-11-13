require 'colorize'

class Road
# une route a une longueur, une largeur, un nom, un revêtement
# on peut dessiner cette route (=behaviour)
  def initialize(length, width, name, color)
    @length = length
    @width = width
    @name = name
    @color = color
  end

  def display
    puts ("-"*@length).colorize(@color.to_sym)
    print "\n"*((@width-2)/2)
    puts (" -"*(@length/2)).colorize(@color.to_sym)
    print "\n"*((@width-2)/2)
    puts ("-"*@length).colorize(@color.to_sym)
  end
end



new_road = Road.new(75, 10, "Route 66", "yellow")
