module NotificationsHelper
  def recent_notifications
    Notification.order(created_at: :desc).limit(10)
  end
end
