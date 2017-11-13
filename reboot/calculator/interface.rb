require_relative"calculator"

# TODO :  coder une calculatrice

# demander à l'utlisateur un premier nombre
# récupérer le nombre entrée par l'utlisateur
# Demander le deuxième chiffre
# récuperer le nombre entrée par l'utilisateur
# demander l'opération (+, -, *, /)
# stocker l'opération
# selon l'opération calculer le résultat
# Afficher le résulat à l'utilisateur
choice = y
while choice == "y"
  print "Entrer le premier nombre de votre opération >"
  first_number = gets.chomp.to_f

  print "Entrer le second nombre de votre opération >"
  second_number = gets.chomp.to_f

  print "Entrer votre opération (+, -, *, /) >"
  operation = gets.chomp

  result = calculate(first_number, second_number, operation)

  if result
   puts "Votre résultat est #{result}"
  else
   puts "Résultat invalide"
  end
  puts "veux tu continuer? (y/n)"
  choice = gets.chomp
end

