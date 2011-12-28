class ChangeCommentFromStringToText < ActiveRecord::Migration
  def up
    change_table :problems do |t|
      t.change :comment, :text
    end
  end

  def down
    change_table :problems do |t|
      t.change :comment, :string
    end    
  end
end
