class Ticket < ActiveRecord::Base
  has_many :ticket_type
  belongs_to :attendee
end
