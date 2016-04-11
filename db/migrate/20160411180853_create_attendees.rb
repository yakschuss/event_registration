class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :company
      t.integer :ticket_id
      t.timestamps null: false

    end

  end
end
