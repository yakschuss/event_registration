class Event < ActiveRecord::Base
  has_many :ticket_types
  has_many :tickets, through: :ticket_types

  def set_types(ticket_type)
    self.ticket_types = []
  end
end
