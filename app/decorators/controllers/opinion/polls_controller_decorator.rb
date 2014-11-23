Opinion::PollsController.class_eval do
	before_action :authenticate_user!

	helper ApplicationHelper
	helper ForemHelper
end