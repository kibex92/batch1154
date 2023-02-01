class SessionsView
  def ask_user_for(input)
    puts "#{input}?"
    gets.chomp
  end

  def wrong_credentials
    puts "Sorry, wrong username/password. Try again"
  end

  def successfull_login
    puts "Welcome!"
  end
end