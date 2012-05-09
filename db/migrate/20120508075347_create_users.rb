class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail
      t.string :login
      t.string :url
      t.string :summary
      t.text :description
      t.text :categorys_text
      t.text :teams_text

      t.timestamps
    end
  end
end
