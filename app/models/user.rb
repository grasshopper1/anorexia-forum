class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # FIXME change this in an actual name
  def forem_name
	  email
  end

  def forem_email
	  email
  end

	def forem_admin?
		email.match /haikobleumink/
	end
end
