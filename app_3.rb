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
my_game = Game.new(name)
puts ""
puts "Bienvenue #{name}!"
puts "---------- Tape entrer pour continuer -----------"
while my_game.is_still_ongoing? == true
  puts "Voici ton état :"
  puts my_game.show_players
  puts ""
  puts "---------- Tape entrer pour continuer -----------"
  gets.chomp 
  my_game.menu
  my_game.menu_choice
  puts "" 
  puts ""
  puts "Les ennemies attaquent !!"
  my_game.enemies_attack 
  my_game.end
end 
