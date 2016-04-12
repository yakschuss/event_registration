class Admin::AttendeesController < Admin::ApplicationController
  def index
    @attendees = Attendee.all
  end

  def show
    @attendee = Attendee.find(params[:id])
  end

  def new
    @attendee = Attendee.new
  end

  def create
    @attendee = Attendee.create(attendee_params)

    if @attendee.save
      flash[:notice] = "Attendee was created successfully."
      redirect_to admin_attendee_path(@attendee)
    else
      flash[:error] = "There was an error creating the Attendee. Please try again."
      render new
    end

  end

  def edit
    @attendee = Attendee.find(params[:id])
  end

  def update
    @attendee = Attendee.find(params[:id])
    @attendee.assign_attributes(attendee_params)

    if @attendee.save
      flash[:notice] = "Attendee updated."
      redirect_to admin_attendee_path(@attendee)
    else
      flash[:error] = "There was an error saving the Attendee. Please try again."
      render :edit
    end

  end


  def destroy
    @attendee = Attendee.find(params[:id])

    if @attendee.destroy
      flash[:notice] = "\"#{@attendee.first_name} #{@attendee.last_name}\" was deleted successfully."
      redirect_to admin_attendees_path
    else
      flash[:error] = "There was an error deleting the Attendee."
      render :show
    end
  end

  private

  def attendee_params
    params.require(:attendee).permit(:first_name, :last_name, :email, :company)
  end
end
