class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :user_id
      t.date :date
      t.string :category
      t.string :team
      t.string :opp
      t.integer :score
      t.integer :opp_score
      t.string :competition
      t.string :place
      t.text :note

      t.timestamps
    end
  end
end
