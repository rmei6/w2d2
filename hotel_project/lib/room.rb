class Room

  def initialize(capacity)
    @capacity = capacity
    @occupants = Array.new(0)
  end

  def capacity
    @capacity
  end

  def occupants
    @occupants
  end

  def full?
    return false if @occupants.length < @capacity
    return true if @occupants.length == @capacity
  end

  def available_space
    @capacity - @occupants.length
  end

  def add_occupant(name)
    if full?
        return false
    else
        @occupants << name
        return true
    end
  end
  
end