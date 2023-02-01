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

  def ask_for_index
    ask_user_for("number").to_i - 1
  end

  def display(riders)
    riders.each_with_index do |rider, index|#
      puts "#{rider.username}"
    end
  end
end