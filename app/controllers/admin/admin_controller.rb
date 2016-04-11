class Admin::AdminController < Admin::ApplicationController
  def show
    @admin = Admin.find(params[:id])
  end

end
