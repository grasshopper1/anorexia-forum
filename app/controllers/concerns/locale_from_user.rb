module LocaleFromUser
	extend ActiveSupport::Concern

	# noinspection RubyArgCount
	included do
		before_action :set_locale
	end

	# Set the correct default locale.
	#
	# Use the locale from current signed-in user or the default locale when no user is signed in.
	#
	# @see ApplicationController#extract_locale_from_user
	# noinspection RubyResolve
	def set_locale
		if current_user
			Rails.logger.debug { "Setting locale <#{current_user.country.locale.to_sym}> using current user: #{current_user}" }
			I18n.locale = current_user.country.locale.to_sym
		else
			Rails.logger.debug { "Using default locale <#{I18n.default_locale}>, because no user is signed in." }
			I18n.locale = I18n.default_locale
		end
	end
end