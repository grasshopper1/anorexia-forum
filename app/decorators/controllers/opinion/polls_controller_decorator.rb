Opinion::PollsController.class_eval do
	include LocaleFromUser
	before_action :authenticate_user!

	helper ApplicationHelper
	helper ForemHelper
end