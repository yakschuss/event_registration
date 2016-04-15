class Ticket < ActiveRecord::Base
  has_one :ticket_type
  belongs_to :attendee
  belongs_to :event

  accepts_nested_attributes_for :attendee
end
