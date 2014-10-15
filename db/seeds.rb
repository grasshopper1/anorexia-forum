# languages available
languages = {
		:en =>
			{
				:en_language => 'English',
				:nl_language => 'Dutch',
				:de_language => 'German',
			},
		:nl =>
				{
						:en_language => 'Engels',
						:nl_language => 'Nederlands',
						:de_language => 'Duits',
				},
		:de =>
				{
						:en_language => 'Englisch',
						:nl_language => 'Niederländisch',
						:de_language => 'Deutsch',
				},
}

en_country = Country.new(:locale => :en, :plural => 'England', :route_name => 'english')
nl_country = Country.new(:locale => :nl, :plural => 'Nederland', :route_name => 'nederlands')
de_country = Country.new(:locale => :de, :plural => 'Deutschland', :route_name => 'deutsch')

# Assign correct language globalization to countries.
languages.each do |locale, languages|
	I18n.locale = locale

	languages.each do |attr_with_locale,value|
		country = case attr_with_locale
							when :en_language
								en_country
							when :nl_language
								nl_country
							when :de_language
								de_country
							end

		country.language = value
		country.save
	end
end

User.create!(:name => 'Administrator',
             :email => 'admin@anorexia-forum.com',
             :password => 'password',
             :password_confirmation => 'password',
             :roles => ['admin'],
             :country_id => en_country.id)

# Keep this in track with the route_names of the countries!
Forem::Category.create!(:name => 'English')
Forem::Category.create!(:name => 'Nederlands')
Forem::Category.create!(:name => 'Deutsch')
