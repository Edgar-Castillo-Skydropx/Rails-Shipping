# frozen_string_literal: true

class Notification::ToastComponent < ViewComponent::Base
  def initialize(notification)
    @notification = notification
  end
end
