Rails.application.config.to_prepare do
	Opinion::ApplicationController.layout 'application'
end

Opinion.configure do |config|
	# Uncomment next two lines to enable highcharts after downloading highcharts and placing it in app/assets/javascripts dir.
	# config.charts_engine = :highcharts
	# config.charts_engine_location = 'highcharts.js'
	config.vote_later_type = :enable
	config.vote_later_wait = 300.seconds
	config.end_poll_on_activate = true
end

Opinion::ControllerHelper.class_eval do
	# Whether the poll should be displayed.
	#
	# @return [Boolean] Whether the poll should be displayed.
	def opinion_show_poll?
		begin
			unless opinion_user.nil?
				# devise user needs to be trackable
				return opinion_user.sign_in_count > 1 || opinion_user.last_sign_in_at + 300.seconds < Time.zone.now
			end
		rescue NoMethodError
			false
		end
	end
end