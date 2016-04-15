class Admin::AdminController < Admin::ApplicationController
before_action :require_sign_in
  def show
    @admin = Admin.find(params[:id])
  end


  def require_sign_in
    unless current_user
      flash[:error] = "You must be logged in to do that"
      redirect_to new_admin_session_path
    end
  end
end
