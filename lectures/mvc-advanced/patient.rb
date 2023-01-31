class Patient
  attr_reader :name
  attr_accessor :room, :id

  def initialize(attr = {})
    # STATE
    # name
    # cured
    # blood_type
    # age
    # gender
    # weight
    @name = attr[:name]
    @id = attr[:id]
    @room = attr[:room] # -> Room Object 
    @cured = attr[:cured] || false
  end

  # BEHAVIOUR

  # cured!
  # cured?
  # discharge

  def cured!
    @cured = true
  end

  def cured?
    @cured
  end
end

