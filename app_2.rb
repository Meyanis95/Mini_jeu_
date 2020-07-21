require_relative 'lib/player'
require_relative 'lib/game'
require 'pry'

system "clear"
puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "---------- Tape entrer pour démarrer -----------"
puts "------------------------------------------------"
gets.chomp 
puts "> C'est quoi ton blaze ?"
name = gets.chomp
user = HumanPlayer.new(name)
puts ""
puts "Bienvenue #{user.name} !"

player1 = Player.new("Josiane")
player2 = Player.new("José")

enemies = [player1, player2]

while (player1.life_points>0 || player2.life_points>0) && user.life_points>0
  puts "Voici ton état :"
  puts user.show_state
  puts ""
  puts "---------- Tape entrer pour continuer -----------"
  gets.chomp 
  puts ""
  puts "Quelle action veux-tu effectuer ?"
  puts ""
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts ""
  puts "attaquer un joueur en vue :"
  puts "0 - "+player1.show_state.to_s
  puts "1 - "+player2.show_state.to_s
  option = gets.chomp
  puts ""
  puts "------------------------------------------------"
  puts ""
  if option == "a"
    user.search_weapon
  elsif option == "s"
    user.search_health_pack
  elsif option == "0"
    user.attacks(player1)
  elsif option == "1"
    user.attacks(player2)
  else  
    puts "Cette option n'est pas possible"
  end
  puts ""
  puts "Les autres joueurs t'attaquent !"
  puts ""
  enemies.each do |player|
    if player.life_points > 0
      player.attacks(user)
    end
  end
end

puts "La partie est finie !"

if player1.life_points <= 0 && player2.life_points <= 0
  puts "BRAVO ! TU AS GAGNE !"
else  
  puts "Loser ! Tu as perdu !"
end

