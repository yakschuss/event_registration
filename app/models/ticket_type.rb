class TicketType < ActiveRecord::Base
  belongs_to :event

  def to_dollars(num)
    "$"+"#{(num/100)}"
  end
end
