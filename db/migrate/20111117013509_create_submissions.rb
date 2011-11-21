class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :user_id
      t.integer :problem_id
      t.text :script, :null => false

      t.timestamps
    end
    add_index :submissions, [:user_id, :problem_id]
  end
end
