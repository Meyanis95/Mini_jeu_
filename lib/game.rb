class Game
  attr_accessor :enemies, :human_player

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @enemies = Array.new
    4.times do |i|
      @enemies << Player.new("player#{i+1}")
    end
  end

  def kill_player(player)
    @enemies.delete_at(player)
  end 

  def is_still_ongoing?
    if @human_player.life_points > 0 && @enemies.length > 0
      return true
    end 
  end 

  def show_players
    puts "#{@human_player.name} a #{@human_player.life_points} points de vie"
    puts "Il reste encore #{@enemies.length} ennemie(s) à combattre"
  end

  def menu
    puts ""
    puts "Quelle action veux-tu effectuer ?"
    puts ""
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts ""
    puts "attaquer un joueur en vue :"
    @enemies.each do |enemie|
      puts "#{@enemies.index(enemie)} - #{enemie.show_state}"
    end
  end 

  def menu_choice
    option = gets.chomp
    if option == "a"
      @human_player.search_weapon
    elsif option == "s"
      @human_player.search_health_pack
    else @human_player.attacks(@enemies[option.to_i])
      if @enemies[option.to_i].life_points <= 0
        kill_player(option.to_i)
      end
    end
  end 

  def enemies_attack 
    @enemies.each do |player|
      if player.life_points > 0
        player.attacks(@human_player)
      end
    end
  end 

  def end 
    if @enemies.length == 0 || @human_player.life_points <= 0
      puts "La partie est finie !"
    end 
    if @enemies.length == 0 && @human_player.life_points > 0
      puts "BRAVO ! TU AS GAGNE !"
    elsif @human_player.life_points <= 0
      puts "Loser ! Tu as perdu !"
    end
  end 

end
