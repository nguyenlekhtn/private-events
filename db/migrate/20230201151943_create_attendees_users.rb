class CreateAttendeesUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :attendees_users do |t|
      t.belongs_to :attendee, index: true, foreign_key: { to_table: :users }
      t.belongs_to :event, index: true, foreign_key: true
      t.timestamps
    end
  end
end
