class Notification < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :user
  after_create_commit :publish_notification
  after_destroy_commit :broadcast_destroy

  def publish_notification
    NotificationBroadcastService.broadcast_append_to(
      :notifications_channel, "notifications_list", "notifications/notification", { notification: self })

    NotificationBroadcastService.broadcast_prepend_to(
      :notifications_menu, "notifications_tag", "notifications/notification", { notification: self, isMenu: true })
  end

  def broadcast_destroy
    NotificationBroadcastService.broadcast_remove_to(:notifications_channel, dom_id(self))
    NotificationBroadcastService.broadcast_remove_to(:notifications_menu, "#{dom_id(self)}-menu")
  end
end
