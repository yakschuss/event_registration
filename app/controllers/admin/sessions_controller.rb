class Admin::SessionsController < Admin::ApplicationController

  def new
    @disable_nav = true
  end

  def create
    admin = Admin.find_by(email: params[:session][:email].downcase)

    if admin && admin.authenticate(params[:session][:password])
      create_session(admin)
      flash[:notice] = "Welcome back"
      redirect_to admin_admin_path(admin)
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
