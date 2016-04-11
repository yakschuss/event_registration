class SessionsController < ApplicationController

  def new
  end

  def create
    admin = Admin.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      create_session(admin)
      flash[:notice] = "Welcome back, #{admin.name}."
      redirect_to "admin#show"
    else
      flash.now[:alert] = "invalid email/password combination"
      render :new
    end
  end

  def destroy
    destroy_session(current_user)
    flash[:notice] = "Successfully signed out."
    redirect_to root_path
  end
end
