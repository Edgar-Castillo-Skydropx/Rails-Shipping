class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def require_admin!
    unless current_user&.isAdmin
      flash[:alert] = "You don't have permission to access this page."
      redirect_to root_path
    end
  end
end
