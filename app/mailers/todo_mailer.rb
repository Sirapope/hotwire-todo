class TodoMailer < ApplicationMailer
  def overdue_notification(todo)
    @todo = todo
    @user = todo.assigned_user
    mail(to: @user.email, subject: "Todo Due Today: #{@todo.name}") do |format|
      format.html
    end
  end
end


