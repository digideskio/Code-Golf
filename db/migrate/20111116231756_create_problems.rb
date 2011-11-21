class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :title
      t.string :description
      t.integer :par_score
      t.boolean :current_problem, :default => true
      
      t.timestamps
    end
  end
end
