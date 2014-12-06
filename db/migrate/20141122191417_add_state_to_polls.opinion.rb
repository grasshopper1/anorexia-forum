# This migration comes from opinion (originally 20141106203524)
class AddStateToPolls < ActiveRecord::Migration
	def change
		add_column :opinion_polls, :state, :string
	end
end
