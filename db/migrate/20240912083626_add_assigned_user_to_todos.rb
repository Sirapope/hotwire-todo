class AddAssignedUserToTodos < ActiveRecord::Migration[7.2]
  def change
    add_reference :todos, :assigned_user, foreign_key: { to_table: :users }
  end
end
