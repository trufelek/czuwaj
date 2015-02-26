class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_order, :current_userid

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied!"
    redirect_to root_url
  end

  def current_order
    if user_signed_in?
      if (Order.find_by user_id:current_user.id).nil?
        Order.new
      elsif Order.find_by(iscart: 0, user_id: current_user.id).nil?
        Order.new
      else
        Order.find_by(iscart: 0, user_id: current_user.id)
      end
    end
  end

  protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :name
  	devise_parameter_sanitizer.for(:account_update) << :name
  end

end
