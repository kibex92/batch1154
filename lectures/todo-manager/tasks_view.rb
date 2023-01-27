class TasksView

  # BEHAVIOUR
  def ask_user_for_description
    puts "What's the task?"
    gets.chomp
  end

  def display(tasks)
    tasks.each_with_index do |task, index|
      status = task.done? ? "[X]" : "[ ]"
      puts "#{index + 1} - #{status} #{task.description}"
    end
  end

  def ask_user_for_index
    puts "What is the number of the task you want to mark as done?"
    gets.chomp.to_i - 1
  end
end