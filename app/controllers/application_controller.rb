class ApplicationController < ActionController::Base

  rescue_from CanCan::AccessDenied do |exception|

    if exception.action == :show and exception.subject.class.name == 'DemoGem'
      redirect_to new_session_path(User.new)
    else
      render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
    end
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end
end
