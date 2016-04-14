class Admin::EventsController < Admin::ApplicationController
#before_action :require_sign_in

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @event.ticket_types.build
  end

  def create
    @event = Event.create(event_params)
    create_ticket_types
    if @event.save
      flash[:notice] = "Event was created successfully."
      redirect_to admin_event_path(@event)
    else
      flash[:error] = "There was an error creating the event. Please try again."
      render new
    end

  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.assign_attributes(event_params)

    if @event.save
      flash[:notice] = "Event updated."
      redirect_to admin_event_path(@event)
    else
      flash[:error] = "There was an error saving the event. Please try again."
      render :edit
    end

  end


    def destroy
      @event = Event.find(params[:id])

      if @event.destroy
        flash[:notice] = "\"#{@event.name}\" was deleted successfully."
        redirect_to admin_events_path
      else
        flash[:error] = "There was an error deleting the event."
        render :show
      end
    end

  private

  def create_ticket_types
    params[:event][:ticket_types_attributes].values.each do |ticket_type_params|
      @event.ticket_types.create(ticket_type_params)
    end
  end


  def event_params
    params.require(:event).permit(:name, :date, :description)
  end

  def ticket_type_params
    params.require(:event).permit(ticket_types_attributes: [:level, :cost])
  end
end
