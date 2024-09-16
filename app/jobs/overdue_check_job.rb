class OverdueCheckJob < ApplicationJob
  queue_as :default

  def perform
    puts "Running OverdueCheckJob at #{Time.current}"
    
    overdue_todos = Todo.where("due_date < ? AND status = ?", Date.current, Todo.statuses[:incomplete])
    
    overdue_todos.each do |todo|
      puts "Processing overdue todo: #{todo.id} - #{todo.name}"
      TodoMailer.overdue_notification(todo).deliver_now
      puts "Sent notification for todo: #{todo.id}"
    end

    puts "Finished OverdueCheckJob. Processed #{overdue_todos.count} overdue todos."
  end
end
