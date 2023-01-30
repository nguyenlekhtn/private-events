class AddReferenceEventsCreator < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :creator, foreign_key: { to_table: :users }, null: false
  end
end
