class CreateRoles < ActiveRecord::Migration
	def change
		create_table :roles do |t|
			t.string :name
			t.integer :role, :integer
			t.belongs_to :users
			t.timestamps
		end
	end
end
