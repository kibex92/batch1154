class Meal
  attr_reader :name, :price
  attr_accessor :id

  def initialize(attr = {})
    @id = attr[:id]
    @name = attr[:name]
    @price = attr[:price]
  end
end
