class Attendee < ActiveRecord::Base
  before_create :purchase_ticket

  has_one :ticket

  def purchase_ticket
  end
end
