class CreateProblems < ActiveRecord::Migration[7.0]
  def change
    create_table :problems do |t|
      t.string  :problem_title, null: false
      t.string  :message, null: false
      t.integer :standpoint_id, null: false
      t.timestamps
    end
  end
end
