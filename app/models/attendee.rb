class Attendee < ActiveRecord::Base
  has_one :ticket
end
