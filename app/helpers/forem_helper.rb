module ForemHelper
	def forem_user
		current_user
	end

	# Copied from Forem::ApplicationController, because helper was not available here.
	def forem_admin?
		forem_user && forem_user.forem_admin?
	end

	# Copied from Forem::ApplicationController, because helper was not available here.
	def forem_admin_or_moderator?(forum)
		forem_user && (forem_user.forem_admin? || forum.moderator?(forem_user))
	end
end