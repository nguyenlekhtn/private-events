class DropAttendeesUsers < ActiveRecord::Migration[7.0]
  def change
    drop_table :attendees_users
  end
end
