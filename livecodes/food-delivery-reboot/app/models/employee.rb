class Employee
  attr_reader :username, :password, :role
  attr_accessor :id

  def initialize(attr = {})
    # STATE
    # id
    # username
    # password
    # role
    @id = attr[:id]
    @username = attr[:username]
    @password = attr[:password]
    @role = attr[:role]
  end


  # BEHAVIOUR
  def manager?
    @role == "manager"
  end

  def rider?
    @role == "rider"
  end
end