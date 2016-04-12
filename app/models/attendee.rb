class Attendee < ActiveRecord::Base
  before_create :purchase_ticket

  has_one :ticket



end
