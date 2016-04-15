class Attendee < ActiveRecord::Base
  has_one :ticket

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :company, presence: true
  validates :email, presence: true
end
