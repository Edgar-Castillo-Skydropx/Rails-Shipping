module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      session_data = cookies.encrypted[:_shipping_session] || {}
      user_id = session_data["warden.user.user.key"]&.dig(0, 0)

      if user_id && (current_user = User.find_by(id: user_id))
        current_user
      else
        reject_unauthorized_connection
      end
    end
  end
end
