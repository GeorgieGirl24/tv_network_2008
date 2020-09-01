class Network
  attr_reader :shows
  attr_accessor :name
  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show_name)
    @shows << show_name
  end

  def main_characters
    the_main_characters = @shows.map do |show|
      show.characters.select do |character|
        character.salary > 500_000
      end
    end.flatten
    the_main_characters.select do |character|
      character.name == character.name.upcase
    end
  end

  def actors_by_show
    @shows.group_by do |show|
      show.characters.map do |character|
        character.actor
      end
    end.invert
  end

end
