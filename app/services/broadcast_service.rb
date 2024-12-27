class BroadcastService
  def self.broadcast_to(method, channel, target:, partial:, locals:)
    unless [ :broadcast_append_to, :broadcast_prepend_to ].include?(method)
      raise ArgumentError, "Invalid method: #{method}. Valid methods are :broadcast_append_to or :broadcast_prepend_to."
    end

    Turbo::StreamsChannel.send(method, channel, target: target, partial: partial, locals: locals)
  end

  def self.broadcast_remove_to(channel, target)
    Turbo::StreamsChannel.broadcast_remove_to channel, target: target
  end

  def self.broadcast_toast(html)
    Turbo::StreamsChannel.broadcast_append_to(
      :toast_notifications, target: "toast_notifications_container", html: html
    )
  end
end
