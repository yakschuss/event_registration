class Ticket < ActiveRecord::Base
  has_one :ticket_type
  belongs_to :attendee
  belongs_to :event
  before_create :generate_token

  accepts_nested_attributes_for :attendee


  def to_dollars(num)
    "$"+"#{(num/100)}"
  end

  protected

  def generate_token
    loop do
      self.token = SecureRandom.base64(15)
      break unless Ticket.find_by(token: token)
    end
  end

end
