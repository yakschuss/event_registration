class Admin::AttendeesController < Admin::ApplicationController

  def index
    @attendees = Attendee.all
  end
  
end
