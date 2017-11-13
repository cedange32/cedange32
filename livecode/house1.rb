require 'colorize'

class House
# une maison a une longueur, une largeur et une couleur
# on peut dessiner une maison
  def initialize(length, width, color)
    @length = length
    @width = width
    @color = color
  end

  def display
    puts ("#"*@length).colorize(@color.to_sym)
    print (("#" + (" ") * (@length-2) + "#\n") * (@width-2)).colorize(@color.to_sym)
    puts ("#"*@length).colorize(@color.to_sym)
  end
end

my_house = House.new(10, 8, "red")


