class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	def after_sign_in_path_for(resource)
    user_path(resource) # ログイン後に遷移するpathを設定
  	end
  	protected
  	  def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :password, :password_confirmation, :email) }
    	devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:name, :password, :password_confirmation) }
      end

end
