class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail
      t.string :login
      t.string :summary
      t.text :description

      t.timestamps
    end
  end
end