class Network
  attr_reader :name, :shows
  def initialize(name)
    @name = name
    @shows = []
  end

  def add_show(show_name)
    @shows << show_name
  end
end
