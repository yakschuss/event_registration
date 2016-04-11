class Event < ActiveRecord::Base
  has_many :ticket_types
end
