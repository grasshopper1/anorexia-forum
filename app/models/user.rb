class User < ActiveRecord::Base
	ROLES = %w[admin moderator banned]
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable

	validates :name, presence: true
	validates :name, uniqueness: true

	belongs_to :country

	def forem_name
		name
	end

	def forem_email
		email
	end

	def forem_admin?
		roles.include? 'admin'
	end

	def roles=(roles)
		self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
	end

	def roles
		ROLES.reject do |r|
			((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
		end
	end
end
