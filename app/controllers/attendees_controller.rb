class AttendeesController < ApplicationController


  def new
    @attendee = Attendee.new
    @event = Event.find_by(params[:event_id])
  end

  def create
    @attendee = Attendee.create(attendee_params)

    if @attendee.save
      flash[:notice] = "your registration was received, and was created successfully."
      render "events/index"
    else
      flash[:error] = "There was an error creating your account. Please try again."
      render new
    end
  end

  def attendee_params
    params.require(:attendee).permit(:first_name, :last_name, :email, :company)
  end
end
