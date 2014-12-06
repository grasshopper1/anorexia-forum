# This migration comes from opinion (originally 20141025144628)
class ChangePollNameToQuestion < ActiveRecord::Migration
	def change
		rename_column :opinion_polls, :description, :question
	end
end
