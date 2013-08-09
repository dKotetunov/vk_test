class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :surname, :pol

	def self.reg (country)
		Carmen::Country.coded(country).subregions.map { |s| [s.name, s.code] }
	end
end
