class EventsController < Admin::ApplicationController
  def index
    @events = Event.all
  end
end
