class Notification < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :user
  after_create_commit :publish_notification
  after_destroy_commit :broadcast_destroy

  def publish_notification
    Turbo::StreamsChannel.broadcast_append_to(
      :notifications_channel, target: "notifications_list",
      partial: "notifications/notification", locals: { notification: self })
  end

  def broadcast_destroy
    Turbo::StreamsChannel.broadcast_remove_to :notifications_channel, target: dom_id(self)
  end
end
