Forem::Topic.class_eval do
	# Check whether a topic may be deleted.
	def can_be_deleted?
		forem_user.forem_admin? || (self.posts.map { |post| post.user == forem_user }.uniq == [true])
	end
end