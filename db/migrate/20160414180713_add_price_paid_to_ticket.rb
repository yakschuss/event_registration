class AddPricePaidToTicket < ActiveRecord::Migration
  def change
      add_column :tickets, :price_paid, :decimal
  end
end
