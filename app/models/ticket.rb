class Ticket < ActiveRecord::Base
  has_many :ticket_types
  belongs_to :attendee
end
