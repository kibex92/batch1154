class Room
  attr_reader :name, :patients
  attr_accessor :id

  # STATE
  # capacity
  # patients
  # number/name
  # equipment

  def initialize(attr = {})
    @name = attr[:name]
    @capacity = attr[:capacity]
    @id = attr[:id]
    @patients = attr[:patients] || [] # -> Array of Patient objects
  end

  # BEHAVIOUR
  # full?
  # add_patient

  def add_patient(patient)
    unless full?
      @patients << patient
      patient.room = self
    else
      raise Exception, "#{name} is full!"
    end
  end

  def full?
    @patients.size >= @capacity
  end
end