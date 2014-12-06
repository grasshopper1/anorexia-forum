class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable

	acts_as_voter

	validates :name, presence: true
	validates :name, uniqueness: true

	belongs_to :country
	has_and_belongs_to_many :roles

	def forem_name
		name
	end

	def forem_email
		email
	end

	def forem_admin?
		!roles.select { |role| role.admin? }.empty?
	end
end
