class Event < ActiveRecord::Base
  has_many :ticket_types
  has_many :tickets, through: :ticket_types


end
