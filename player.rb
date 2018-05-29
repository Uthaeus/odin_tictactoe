

class Player
  
  attr_accessor :picks, :name, :token 
  
  def initialize
    @instances
    @name
    @picks = []
    @token
    
  end

  def update_picks location
    @picks.push(location)
  end

  def token
    @token
  end

  def picks
    @picks 
  end

  def name
    @name
  end

end