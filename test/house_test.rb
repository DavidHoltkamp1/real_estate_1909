require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test

  def setup
  @house = House.new("$400000", "123 sugar lane")
  @room_1 = Room.new(:bedroom, 10, 13)
  @room_2 = Room.new(:bedroom, 11, 15)
  @room_3 = Room.new(:living_room, 25, 15)
  @room_4 = Room.new(:basement, 30, 41)
  end

  def test_it_exists
    @house = House.new("$400000", "123 sugar lane")

    assert_instance_of House, @house
  end

  def test_it_has_a_price
    assert_equal "$400000", @house.price
  end

  def test_it_has_an_address
    assert_equal "123 sugar lane", @house.address
  end

  def test_it_has_rooms
    assert_equal [], @house.rooms
  end

  def test_you_can_add_rooms
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, 13)
    @house.add_room(@room_1)
    assert_equal 1, @house.rooms.length
  end

  def test_you_can_add_another_room
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, 13)
    @room_2 = Room.new(:bedroom, 11, 15)
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    assert_equal 2, @house.rooms.length

  end

  def test_you_can_get_all_from_category
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, 13)
    @room_2 = Room.new(:bedroom, 11, 15)
    @room_3 = Room.new(:living_room, 25, 15)
    @room_4 = Room.new(:basement, 30, 41)

    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal [@room_1, @room_2], @house.get_all_from_category(:bedroom)
    assert_equal [@room_3], @house.get_all_from_category(:living_room)
    assert_equal [@room_4], @house.get_all_from_category(:basement)
  end

  def test_area_of_whole_house
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, 13)
    @room_2 = Room.new(:bedroom, 11, 15)
    @room_3 = Room.new(:living_room, 25, 15)
    @room_4 = Room.new(:basement, 30, 41)

    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    assert_equal 1900, @house.area 

  end

end
