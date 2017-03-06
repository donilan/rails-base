module AuthToken
  extend ActiveSupport::Concern
  included do
    AUTH_TOKEN_EXPIRED_TIME = 2.minutes
    def auth_token(hash={})
      expired = hash[:expired] || AUTH_TOKEN_EXPIRED_TIME
      force = hash[:force]
      return read_attribute(:auth_token) if auth_token_expired_at && auth_token_expired_at > DateTime.now && !force
      token = loop do
        token = Devise.friendly_token(64)
        break token unless User.where(auth_token: token).first
      end
      update_attributes auth_token: token, auth_token_expired_at: DateTime.now + expired
      token
    end

    def reset_auth_token!
      auth_token(force: true)
    end
  end
end
