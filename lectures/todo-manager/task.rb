class Task
  attr_reader :description

  # STATES
  # title/description
  # status
  # due date
  # priority
  # category
  # person assigned to
  def initialize(description)
    @description = description
    @done = false
  end

  # BEHAVIOUR
  def done!
    @done = true
  end

  def done?
    @done
  end
end