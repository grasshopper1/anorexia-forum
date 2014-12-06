# This migration comes from opinion (originally 20141025134245)
class CreateOpinionPolls < ActiveRecord::Migration
	def change
		create_table :opinion_polls do |t|
			t.string :view
			t.string :description

			t.timestamps
		end
	end
end
