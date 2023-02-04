class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.belongs_to :attendees, foreign_key: { to_table: :users }
      t.belongs_to :events, foreign_key: true
      t.timestamps
    end
  end
end
