Opinion::OptionsController.class_eval do
	before_action :authenticate_user!

	helper ApplicationHelper
end