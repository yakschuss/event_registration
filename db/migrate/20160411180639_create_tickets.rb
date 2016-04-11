class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :ticket_type_id
      t.integer :attendee_id
      
      t.timestamps null: false
    end
  end
end
