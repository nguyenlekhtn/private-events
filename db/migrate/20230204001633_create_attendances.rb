class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.belongs_to :attendee, foreign_key: { to_table: :users }
      t.belongs_to :event, foreign_key: true
      t.timestamps
    end
  end
end
