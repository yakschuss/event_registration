class TicketsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @ticket = Ticket.new
  end

  def create
    @event = Event.find(params[:event])
  #  @ticket = @event.tickets.build("#")
  end
end
