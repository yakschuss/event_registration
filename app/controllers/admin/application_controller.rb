class Admin::ApplicationController < ActionController::Base
protect_from_forgery with: :exception


layout 'admin'



private

def require_sign_in
  unless current_user
    flash[:error] = "You must be logged in to do that"
    redirect_to new_admin_session_path
  end
end

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
