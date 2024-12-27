class Notification < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :user
  after_create_commit :publish_notification
  after_destroy_commit :broadcast_destroy

  def publish_notification
    BroadcastService.broadcast_to(
      :broadcast_append_to, :notifications_channel,
      target: "notifications_list", partial: "notifications/notification",
      locals: { notification: self })

    BroadcastService.broadcast_to(
      :broadcast_prepend_to, :notifications_menu,
      target: "notifications_tag", partial: "notifications/notification",
      locals: { notification: self, isMenu: true })
  end

  def broadcast_destroy
    BroadcastService.broadcast_remove_to(:notifications_channel, dom_id(self))
    BroadcastService.broadcast_remove_to(:notifications_menu, "#{dom_id(self)}-menu")
  end
end
