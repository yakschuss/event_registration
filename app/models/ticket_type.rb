class TicketType < ActiveRecord::Base
  belongs_to :event
  belongs_to :tickets
end
