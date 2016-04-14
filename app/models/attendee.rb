class Attendee < ActiveRecord::Base
# before_create :purchase_ticket

  has_one :ticket


accepts_nested_attributes_for :ticket
end
