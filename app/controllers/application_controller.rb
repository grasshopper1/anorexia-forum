class ApplicationController < ActionController::Base

	# We want the forem module available in the views and controller.
	helper ForemHelper
	include ForemHelper

	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	before_action :configure_devise_permitted_parameters, if: :devise_controller?
	before_action :set_locale

	protected

	def configure_devise_permitted_parameters
		registration_params = [:name, :email, :password, :password_confirmation, :country_id]

		if params[:action] == 'update'
			devise_parameter_sanitizer.for(:account_update) {
					|u| u.permit(registration_params << :current_password, {role_ids: []})
			}
		elsif params[:action] == 'create'
			devise_parameter_sanitizer.for(:sign_up) {
					|u| u.permit(registration_params)
			}
		end
	end

	# Set the correct default locale.
	#
	# Use the locale from current signed-in user or the default locale when no user is signed in.
	#
	# @see ApplicationController#extract_locale_from_user
	# noinspection RubyResolve
	def set_locale
		if current_user
			I18n.locale = current_user.country.locale.to_sym
		else
			I18n.locale = I18n.default_locale
		end
	end
end
