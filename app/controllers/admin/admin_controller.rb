class Admin::AdminController < Admin::ApplicationController
before_action :require_sign_in
  def show
    @admin = Admin.find(params[:id])
  end

end
