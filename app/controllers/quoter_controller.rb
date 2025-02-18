class QuoterController < ApplicationController
  def home
  end

  def quote
    @quotation = generate_quotation(current_user)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path, notice: "Quotation created successfully." }
    end
  end

  private

  def generate_quotation(user)
    { quote: "12345", user: user }
  end
end
