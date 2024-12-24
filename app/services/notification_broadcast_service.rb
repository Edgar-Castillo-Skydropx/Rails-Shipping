class NotificationBroadcastService
  def self.broadcast_append_to(channel, target, partial, locals)
    Turbo::StreamsChannel.broadcast_append_to(
      channel, target: target,
      partial: partial, locals: locals)
  end

  def self.broadcast_prepend_to(channel, target, partial, locals)
    Turbo::StreamsChannel.broadcast_prepend_to(
      channel, target: target,
      partial: partial, locals: locals)
  end

  def self.broadcast_toast(notification)
    html = ApplicationController.renderer.render(
      partial: "notifications/toast", locals: { notification: notification }
    )

    Turbo::StreamsChannel.broadcast_append_to(
      :toast_notifications, target: "toast_notifications_container", html: html
    )
  end

  def self.broadcast_remove_to(channel, target)
    Turbo::StreamsChannel.broadcast_remove_to channel, target: target
  end
end
