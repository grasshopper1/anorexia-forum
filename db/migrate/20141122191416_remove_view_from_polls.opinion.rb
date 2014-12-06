# This migration comes from opinion (originally 20141106190251)
class RemoveViewFromPolls < ActiveRecord::Migration
	def change
		remove_column :opinion_polls, :view
	end
end
