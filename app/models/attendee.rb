class Attendee < ActiveRecord::Base
  has_one :ticket

  validates :first_name, :last_name, :company, :email, presence: true
end
