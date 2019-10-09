
class House
attr_reader :price, :address, :rooms

def initialize(price, address)
  @price = price
  @address = address
  @rooms = []
end

def add_room(room)
  @rooms.push(room)
end

def get_all_from_category(category)
  rooms_per_cat = []
  @rooms.each do |room|
    if room.category == category
      rooms_per_cat << room
    end
  end
  rooms_per_cat
end

# def area
#   room_area = []
#   @rooms.each do |room|
#     @length * @width
#     room_area << sum
# end
# room_area.sum
# end
end
