class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :token_auth
  after_action :prepare_unobtrusive_flash

  protected

  def token_auth
    # return user_signed_in?
    if token = params[:token] || headers[:token]
      logger.info "Found auth token #{token}, going to sign in with it"
      user = User.find_by(auth_token: token)
      if user && Devise.secure_compare(user.auth_token, params[:token])
        user.reset_auth_token!
        sign_in user#, store: false
        logger.info "token is correct, logged in with #{user}"
      else
        logger.error "token #{token} is not correct"
        raise ActionController::RoutingError.new('Token Expired')
      end
    end
  end


  def configure_permitted_parameters
    added_attrs = [:username, :phone, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end
