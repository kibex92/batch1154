DB = SQlite3.new("db/development.db")

def save
  if @id.nil?
    DB.execute("INSERT INTO...")
  else 
  end
end
