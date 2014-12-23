Forem::ForumsController.class_eval do
	# include ForemHelper
	include LocaleFromUser

	def index
		if forem_admin?
			@categories = Forem::Category.all
		else
			category = Forem::Category.find(forem_user.country.route_name)

			if category.nil?
				flash[:alert] = t('forem.categories.cannot_retrieve_country')
				redirect_to('/info_page/about')
			else
				redirect_to(category_path(category))
			end
		end
	end
end