Forem::ForumsController.class_eval do
	def index
		if forem_admin?
			@categories = Forem::Category.all
		else
			category = Forem::Category.find(forem_user.country.route_name)

			if category.nil?
				# TODO make this localized
				flash[:alert] = 'Something went wrong trying to retrieve your selected country'
				redirect_to('/info_page/about')
			else
				redirect_to(category_path(category))
			end
		end
	end
end