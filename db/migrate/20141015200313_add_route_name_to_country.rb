class AddRouteNameToCountry < ActiveRecord::Migration
	def change
		add_column :countries, :route_name, :string
	end
end
