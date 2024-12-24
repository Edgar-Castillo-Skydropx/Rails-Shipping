class Notification < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :user
  after_create_commit :publish_notification
  after_destroy_commit :broadcast_destroy

  def publish_notification
    Turbo::StreamsChannel.broadcast_append_to(
      :notifications_channel, target: "notifications_list",
      partial: "notifications/notification", locals: { notification: self })

      Turbo::StreamsChannel.broadcast_prepend_to(
      :notifications_menu, target: "notifications_tag",
      partial: "notifications/notification", locals: { notification: self, isMenu: true })
  end

  def broadcast_destroy
    Turbo::StreamsChannel.broadcast_remove_to :notifications_channel, target: dom_id(self)
    Turbo::StreamsChannel.broadcast_remove_to :notifications_menu, target: "#{dom_id(self)}-menu"
  end
end
