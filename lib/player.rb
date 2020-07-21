class Player
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    return "#{@name} a #{@life_points} points de vie"
  end 

  def gets_damage(damage_points)
    @life_points = @life_points - damage_points
    if @life_points <= 0
      puts "Le joueur #{name} a été tué !"
    end
  end

  def attacks(player)
    puts "Le joueur #{name} attaque le joueur #{player.name}"
    damage = compute_damage
    player.gets_damage(damage)
    puts "Il lui inflige #{damage} points de dommages"
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :name, :weapon_level, :life_points

  def initialize(name)
    @name = name 
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    return "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}"
  end 

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon}"
    if new_weapon > @weapon_level
      @weapon_level = new_weapon
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else  
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end 

  def search_health_pack
    dice = rand(1..6)
    if dice == 1
      puts "Tu n'as rien trouvé ..."
    elsif dice == (2..5)
      @life_points += 50
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      if @life_points > 100 
        @life_points = 100
      end
    else  
      @life_points += 80
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      if @life_points > 100 
        @life_points = 100
      end
    end
  end 

end 