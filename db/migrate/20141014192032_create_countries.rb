class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :locale
      t.string :language
      t.string :plural

      t.timestamps
    end
  end
end
