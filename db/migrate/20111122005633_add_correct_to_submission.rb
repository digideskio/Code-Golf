class AddCorrectToSubmission < ActiveRecord::Migration
  def change
    add_column :submissions, :correct, :boolean
  end
end
