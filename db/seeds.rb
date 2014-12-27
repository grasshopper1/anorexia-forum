# encoding: utf-8
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

roles = {
		:en =>
				{
						:admin => 'Administrator',
						:moderator => 'Moderator',
						:banned => 'Banned',
				},
		:nl =>
				{
						:admin => 'Beheerder',
						:moderator => 'Bemiddelaar',
						:banned => 'Verbannen',
				},
		:de =>
				{
						:admin => 'Verwalter',
						:moderator => 'Vermittler',
						:banned => 'Exil',
				},
}

admin_role = Role.create(:name => 'Administrator')
admin_role.admin!
admin_role.save
moderator_role = Role.create(:name => 'Moderator')
moderator_role.moderator!
moderator_role.save
banned_role = Role.create(:name => 'Moderator')
banned_role.banned!
banned_role.save

roles.each do |locale, roles|
	I18n.locale = locale

	roles.each do |role_locale, value|
		role = case role_locale
		          when :admin
			          admin_role
		          when :moderator
			          moderator_role
		          when :banned
			          banned_role
	          end

		role.name = value
		role.save
	end
end

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
             :roles => [admin_role],
             :country_id => en_country.id)

# Keep this in track with the route_names of the countries!
Forem::Category.create!(:name => 'English')
Forem::Category.create!(:name => 'Nederlands')
Forem::Category.create!(:name => 'Deutsch')
