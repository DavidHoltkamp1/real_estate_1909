# pry(main)> require './lib/room'
# #=> true
# pry(main)> room = Room.new(:bedroom, 10, 13)
# #=> #<Room:0x00007fa53b9ca0a8 @category=:bedroom, @length=10, @width=13>
# pry(main)> room.category
# #=> :bedroom
# pry(main)> room.area
# #=> 130

require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/room'

class RoomTest < Minitest::Test

def setup
  @room = Room.new(:bedroom, 10, 13)
end

def test_it_exists
  room = Room.new(:bedroom, 10, 13)

  assert_instance_of Room, @room
end

def test_it_has_a_category
  room = Room.new(:bedroom, 10, 13)

  assert_equal :bedroom, @room.category
end

def test_it_has_an_area
  room = Room.new(:bedroom, 10, 13)

  assert_equal 130, room.area(10, 13)
end


end
