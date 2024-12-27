# frozen_string_literal: true

class Notification::NotificationComponent < ViewComponent::Base
  def initialize(current_user, notifications)
    @current_user = current_user
    @notifications = notifications
  end
end
