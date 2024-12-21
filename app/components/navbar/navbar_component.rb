# frozen_string_literal: true

class Navbar::NavbarComponent < ViewComponent::Base
  def initialize(current_user)
    @current_user = current_user
  end
end
