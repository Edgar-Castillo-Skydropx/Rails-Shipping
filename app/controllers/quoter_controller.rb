class QuoterController < ApplicationController
  before_action :set_tab_uuid, only: :home

  def home
  end

  def quote
    tab_uuid = params[:tab_uuid]

    return head :bad_request if tab_uuid&.blank?

    @quotation = generate_quotation(current_user)

    BroadcastService.broadcast_to(
      :broadcast_prepend_to, "carrier_quotation_#{dom_id(current_user)}",
      target: "carrier_quotation", partial: "quoter/quoter",
      locals: { quotation: @quotation }
    )

    head :ok
  end

  private
  def set_tab_uuid
    gon.tab_uuid = 55
  end

  def generate_quotation(user)
    { quote: "12345", user: user }
  end
end
