# frozen_string_literal: true

class Notification::NotificationComponent < ViewComponent::Base
  def initialize(current_user)
    @current_user = current_user
  end

  def notifications
    @current_user.notifications.order(created_at: :desc).limit(10)
  end
end
