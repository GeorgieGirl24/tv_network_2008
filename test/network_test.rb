require 'minitest/autorun'
require 'minitest/pride'
require './lib/character'
require './lib/show'
require './lib/network'

class NetworkTest < Minitest::Test
  def test_it_exists
    nbc = Network.new("NBC")

    assert_instance_of Network, nbc
  end

  def test_it_has_attributes
    nbc = Network.new("NBC")

    assert_equal "NBC", nbc.name
    assert_equal [], nbc.shows
    refute_equal "CBS", nbc.name
    refute_equal nil, nbc.shows
  end

  def test_it_can_add_shows_to_its_line_up
    michael_knight = Character.new({name: "Michael Knight", actor: "David Hasselhoff", salary: 1_600_000})
    kitt = Character.new({name: "KITT", actor: "William Daniels", salary: 1_000_000})
    knight_rider = Show.new("Knight Rider", "Glen Larson", [michael_knight, kitt])

    leslie_knope = Character.new({name: "Leslie Knope", actor: "Amy Poehler", salary: 2_000_000})
    ron_swanson = Character.new({name: "Ron Swanson", actor: "Nick Offerman", salary: 1_400_000})
    parks_and_rec = Show.new("Parks and Recreation", "Michael Shur & Greg Daniels", [leslie_knope, ron_swanson])

    nbc = Network.new("NBC")
    nbc.add_show(knight_rider)
    nbc.add_show(parks_and_rec)

    assert_equal [knight_rider, parks_and_rec], nbc.shows
    refute_equal [parks_and_rec], nbc.shows
    refute_equal [], nbc.shows
  end
end
