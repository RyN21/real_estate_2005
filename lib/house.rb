class House
  attr_reader :address, :rooms

  def initialize (price, address)
    @price = price
    @address = address
    @rooms = []
    @rooms_by_area = {}
    @rooms_by_category = {}
  end

  def price
    @price.delete("$").to_i
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price.delete('$').to_i > 500000
  end

  def rooms_from_category(room_type)
    category = []
    @rooms.each do |room|
      category << room if room_type == room.category
    end
    category
  end

  def area
    @rooms.inject(0) do |sum, x|
      sum + x.area
    end
  end

  def details
    details = {price, address}
  end

  def price_per_square_foot
    area = @rooms.inject(0) do |sum, x|
      sum + x.area
    end
    squarefoot = @price.delete("$").to_f.round(2) / area
    squarefoot.round(2)
  end

  # def rooms_sorted_by_area
  #
  # end
  #
  # def rooms_by_category
  #
  # end
end
