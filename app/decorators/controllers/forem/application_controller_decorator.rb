Forem::ApplicationController.class_eval do
	layout 'application'

	before_filter :authenticate_user!
end