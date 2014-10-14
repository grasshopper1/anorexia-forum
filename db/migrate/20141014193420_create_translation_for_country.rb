class CreateTranslationForCountry < ActiveRecord::Migration
	def up
		Country.create_translation_table! :language => :string
	end
	def down
		Country.drop_translation_table!
	end
end
