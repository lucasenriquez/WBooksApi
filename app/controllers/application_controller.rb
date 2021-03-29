class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  def authenticate_user_admin!
    if user_admin_signed_in?
      super
    else
      redirect_to new_user_admin_session_path
    end
  end
end
