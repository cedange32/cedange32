# TODO : coder un logiciel pour faire ses courses

# Se donner un panier vide
# Se donner un stock de produits disponibles
# Afficher une liste de produit
# Demander à l'utilisateur quel produit il souhaite
# Ajouter ce choix au panier
# Recommander le choix

cart = []

items = ["pomme", "orange", "quinoa", "pain"]

while true
  puts "les produits disponibles sont :"

  items.each_with_index do |item, index|
    puts "#{index +1} - #{item}"

  end

  puts "Quel produits souhaitez-vous rajouter dans votre panier? Tapez le nom du produit ou exit pour sortir"
  user_choice = gets.chomp
  if user_choice == "exit"
    break
  elsif items.include? user_choice
    cart << user_choice
  else
    puts "Invalid choice."
  end
end

p cart
