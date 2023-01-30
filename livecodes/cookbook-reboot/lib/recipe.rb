class Recipe
  attr_reader :name, :description, :rating, :prep

  def initialize(attr = {})
    @name = attr[:name]
    @description = attr[:description]
    @rating = attr[:rating]
    @done = attr[:done] || false
    @prep = attr[:prep] || false
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = true
  end
end