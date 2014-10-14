class ApplicationController < ActionController::Base

	def forem_user
		current_user
	end
	helper_method :forem_user

	# Copied from Forem::ApplicationController, because helper was not available here.
	def forem_admin?
		forem_user && forem_user.forem_admin?
	end
	helper_method :forem_admin?

	# Copied from Forem::ApplicationController, because helper was not available here.
	def forem_admin_or_moderator?(forum)
		forem_user && (forem_user.forem_admin? || forum.moderator?(forem_user))
	end
	helper_method :forem_admin_or_moderator?

	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	before_action :authenticate_user!

	before_action :configure_devise_permitted_parameters, if: :devise_controller?

	protected

	def configure_devise_permitted_parameters
		registration_params = [:name, :email, :password, :password_confirmation, :country_id]

		if params[:action] == 'update'
			devise_parameter_sanitizer.for(:account_update) {
					|u| u.permit(registration_params << :current_password, {roles: []})
			}
		elsif params[:action] == 'create'
			devise_parameter_sanitizer.for(:sign_up) {
					|u| u.permit(registration_params)
			}
		end
	end
end
