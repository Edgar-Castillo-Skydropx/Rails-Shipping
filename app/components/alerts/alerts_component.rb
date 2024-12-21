# frozen_string_literal: true

class Alerts::AlertsComponent < ViewComponent::Base
  def initialize(notice, alert)
    @notice = notice
    @alert = alert
  end
end
