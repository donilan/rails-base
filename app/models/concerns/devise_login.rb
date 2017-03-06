module DeviseLogin
  extend ActiveSupport::Concern
  included do
    devise :authentication_keys => [:login]
    validates :username, :uniqueness => { :case_sensitive => false }, allow_nil: true
    validates :phone, :uniqueness => { :case_sensitive => false }, allow_nil: true
    validates :email, :uniqueness => { :case_sensitive => false }, allow_nil: true

    def email_required?
      false
    end

    def login=(login)
      @login = login
    end

    def login
      @login || self.username || self.email || self.phone
    end

    def self.find_by_login(login)
      raise Exception.new('login cannot be empty') if login.blank?
      where(
        ["lower(username) = :value OR lower(email) = :value OR phone = :value",
         { :value => login.downcase }]
      ).first
    end

    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(
          ["lower(username) = :value OR lower(email) = :value OR phone = :value",
           { :value => login.downcase }]
        ).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email) ||
            conditions.has_key?(:phone)
        where(conditions.to_h).first
      end
    end

  end
end
