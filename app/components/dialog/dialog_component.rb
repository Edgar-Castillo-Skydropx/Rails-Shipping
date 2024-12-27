# frozen_string_literal: true

class Dialog::DialogComponent < ViewComponent::Base
  def initialize(title)
    @title = title
  end
end
