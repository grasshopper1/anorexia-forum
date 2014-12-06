# ROLES = %w[admin moderator banned]
class Role < ActiveRecord::Base
	translates :name
	has_and_belongs_to_many :users

	TYPES = {
			:admin     => 0,
			:moderator => 1,
			:banned    => 2
	}

	TYPES.each do |key, value|
		eval %Q"
			def #{key}!
				self.role = #{value}
				self.save
			end

			def #{key}?
				self.role == #{value}
			end
		"
	end
end

