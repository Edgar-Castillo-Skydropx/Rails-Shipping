class Notification < ApplicationRecord
  belongs_to :user
  after_create_commit :publish_notification

  def publish_notification
    broadcast_append_to :notifications_channel, target: "notifications_list"
  end
end
