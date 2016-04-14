class Ticket < ActiveRecord::Base
  has_one :ticket_type
  belongs_to :attendee
end
