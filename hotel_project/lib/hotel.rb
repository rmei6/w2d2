require_relative "room"

class Hotel

  def initialize(name,keys)
    @name = name
    @rooms = Hash.new()
    keys.each_pair do |key,value| 
        rooms[key] = Room.new(value) 
    end
  end

  def name
    proper = []
    @name.split(" ").each do |word| 
        proper << word.capitalize 
    end
    proper.join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room)
    @rooms.key?(room)
  end

  def check_in(person,room)
    if !room_exists?(room)
        puts "sorry, room does not exist"
    else
        status = @rooms[room].add_occupant(person)
        if status
            puts "check in successful" 
        else
            puts "sorry, room is full"
        end
    end 
  end

  def has_vacancy?
    @rooms.any? {|key,room| !room.full?}
  end

  def list_rooms
    @rooms.each_pair do |name,room|
        #puts "#{name} : #{room.available_space}"
        puts "#{name}: #{room.available_space}"
    end
  end
end
