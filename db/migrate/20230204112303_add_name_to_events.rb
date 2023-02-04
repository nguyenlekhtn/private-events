class AddNameToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :name, :string
    add_index :events, :name
  end
end
