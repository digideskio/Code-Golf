class AddCommentToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :comment, :string
  end
end
