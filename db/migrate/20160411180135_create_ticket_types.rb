class CreateTicketTypes < ActiveRecord::Migration
  def change
    create_table :ticket_types do |t|
      t.integer :cost
      t.string :type
      t.integer :event_id
      t.timestamps null: false
    end
  end
end
