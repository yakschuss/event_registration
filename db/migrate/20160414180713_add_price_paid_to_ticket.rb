class AddPricePaidToTicket < ActiveRecord::Migration
  def change
      add_column :tickets, :price_paid, :integer
      add_column :tickets, :event_id, :integer
  end
end
