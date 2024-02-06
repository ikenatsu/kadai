class CreateProblemUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :problem_users do |t|
      t.references :problem, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
