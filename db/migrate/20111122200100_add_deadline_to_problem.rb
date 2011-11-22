class AddDeadlineToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :deadline, :datetime
  end
end
