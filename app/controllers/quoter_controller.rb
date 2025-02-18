class QuoterController < ApplicationController
  def home
  end

  def quote
    @tab_uuid = params[:tab_uuid]

    return head :bad_request if !@tab_uuid

    @quotation = generate_quotation(current_user)

    BroadcastService.broadcast_to(
      :broadcast_prepend_to, "carrier_quotation_#{@tab_uuid}",
      target: "carrier_quotation", partial: "quoter/quoter",
      locals: { quotation: @quotation }
    )

    head :ok
  end

  private

  def generate_quotation(user)
    { quote: "12345", user: user }
  end
end
