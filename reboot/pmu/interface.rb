# TODO : parier sur le vainqueur

# message d'accueil
# Se donner le tableau des chevaux
# afficher les chevaux en lice
# demander à l'utilisateur sur quel cheval il veut parier
# stocker le choix de l'utilisateur
# simuler une course
# stocker le résultat
# comparer le choix de l'utilisateur avec le résultat


puts "Bonjour, bienvenue à Longchamp"
horses = ["Canaçon", "Sonic", "Belle de jour", "Bad Boy"]

answer = ""
while answer != "exit"
  puts "Voici les chevaux surlequels vous pouvez parier"
  horses.each_with_index do |horse, index|
    puts "cheval n°#{index + 1} - #{horse}"
  end

  puts "Sur quelle cheval voulez vous parier? donnez son numero"
  answer = gets.chomp
  if answer != "exit"

    index = answer.to_i
    bet = horses[index - 1]

    result = horses.shuffle
    winner = result.first

    if bet == winner
     puts "Tu décroches le gros lot"
    else
     puts "C'est perdu le vainqueur était #{winner}"
    end
  end
end


