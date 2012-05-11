class AddWinToResults < ActiveRecord::Migration
  def change
    add_column :results, :win, :string
  end
end
