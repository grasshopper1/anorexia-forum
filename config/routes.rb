AnorexiaForum::Application.routes.draw do

  get "info_page/about"
	# This line mounts Forem's routes at /forums by default.
	# This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
	# If you would like to change where this extension is mounted, simply change the :at option to something different.
	#
	# We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
	mount Forem::Engine, :at => '/forums'
	mount Opinion::Engine, :at => '/polls'

	devise_for :users

	devise_scope :user do
		get 'sign_in', :to => 'devise/sessions#new'
		get 'sign_out', :to => 'devise/sessions#destroy'
		get 'edit_account', :to => 'devise/registrations#edit'
		get 'sign_up', :to => 'devise/registrations#new'
	end
	# The priority is based upon order of creation: first created -> highest priority.
	# See how all your routes lay out with "rake routes".

	# You can have the root of your site routed with "root"
	# root 'forem/forums#index'
  root 'static_pages#about'
end
