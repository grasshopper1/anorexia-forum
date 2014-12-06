class CreateUserRoleTranslationTable < ActiveRecord::Migration
  def change
	  create_table :roles_users, id: false do |t|
		  t.belongs_to :user
		  t.belongs_to :role
	  end
		remove_column :roles, :users_id
  end
end
