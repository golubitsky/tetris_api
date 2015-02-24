class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :username
      t.integer :score, null: false
      t.integer :lines
      t.integer :start_level
      t.integer :end_level
      t.integer :time

      t.timestamps null: false
    end
  end
end
