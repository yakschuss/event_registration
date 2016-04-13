class Admin::TicketTypesController < Admin::ApplicationController
before_action :ready_event


  def create
    @ticket_type = @event.ticket_types.new(ticket_type_params)
  end



private
  def ready_event
    @event = event.find(params[:event_id])
  end

  def ticket_type_params
    params.require(:ticket_type).permit(:level, :cost)
  end

end
