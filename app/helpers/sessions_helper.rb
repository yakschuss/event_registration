module SessionsHelper

  def create_session(admin)
    session[:admin_id] = admin.id
  end

  def destroy_session(admin)
    session[:admin_id] = nil
  end

  def current_user
    Admin.find_by(id: session[:admin_id])
  end
end
