class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit

  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    redirect_back fallback_location: root_path, alert: 'У вас нет прав доступа!'
  end
end
