class AddSampleOutputToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :sample_output, :text
  end
end
