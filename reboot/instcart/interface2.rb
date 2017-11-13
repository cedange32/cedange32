# Se donner un panier vide
# Se donner un stock de produits disponibles
# Afficher une liste de produit
# Demander à l'utilisateur quel produit il souhaite
# Ajouter ce choix au panier
# Recommancer le choix
# Finaliser la commande
# Afficher le contenu du panier


cart = {}
items = {
  "bananes" => {price: 3.5, stock: 10},
  "poires" => {price: 4.0, stock: 8},
  "pommes" => {price: 12.0, stock: 15},
  "fraises" => {price: 1.2, stock: 20}
}

puts "Les produits disponibles sont :"
items.each do |produit, prix|
  prix = items[produit][:price]
  puts "- #{produit} : #{prix} €"
end

while true

  puts "Choisissez un produit à ajouter au panier ou tapez fin "
  user_order = gets.chomp

  if user_order == "fin"
    break
  elsif items.has_key? user_order
    puts "Combien?"
    amount = gets.chomp.to_i

    while amount > items[user_order][:stock]
      puts "Désolé il n'y en a pas assez, le stock actuel est #{items[user_order][:stock]}... Combien?"
      amount = gets.chomp.to_i
    end


      if cart.has_key? user_order
        cart[user_order] += amount
      else
        cart[user_order] = amount
      end
      # decrementer le stock
      items[user_order][:stock] -= amount

  else
    puts "Produit incorrect"
  end
end


# on part d'un montant nul
# On parcours le panier
# Pour chaque article du panier => chercher le prix
# Ajouter au montant


sum = 0

puts "-" * 60
puts "Ticket de caisse du client"
cart.each do |article, quantity|
  sub_total = items[article][:price] * quantity
  puts "- #{quantity} kg de #{article} à #{items[article][:price]}€ chaque => #{sub_total}€"
  sum += sub_total
end

puts "Total = #{sum}"

puts "-" * 60
puts "Etat du stock"
items.each do | produit, stock|
  stock = items[produit][:stock]
  puts "#{produit} : #{stock}"
end
puts "-" * 60





