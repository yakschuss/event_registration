class TicketsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @ticket = Ticket.new
  end

  def create
    @event = Event.find(params[:event_id])
    charge = CreateCharge.new(ticket_type.cost, params[:stripe_charge])
    charge.send_request_to_stripe
    
    if charge.completed?
      @ticket = @event.tickets.create(ticket_params)
    end
  end

  private

  def ticket_type
    @ticket_type ||= TicketType.find(params[:ticket][:ticket_type_id])
  end

  def ticket_params
    params
      .require(:ticket)
      .permit(:ticket_type_id, :attendee_id, :event_id, :price_paid, attendee_attributes: [:first_name, :last_name, :email, :company])
      .merge(ticket_type_id: ticket_type.id, price_paid: ticket_type.cost)
  end
end
