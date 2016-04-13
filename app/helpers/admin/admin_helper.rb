module Admin::AdminHelper
  def current_user
    Admin.find_by(id: session[:admin_id])
  end
end
