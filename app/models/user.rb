class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :surname, :pol, :updated_at

  attr_accessible :avatar,
  								:path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    							:url => "/system/:attachment/:id/:style/:filename"

  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar, styles: {
    thumb: '100x100',
    square: '200x200',
    medium: '300x300'
  }

  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'sender_id'
  has_many :received_messages, :class_name => 'Message', :foreign_key => 'recipient_id'

  scope :all_online, lambda{ where("updated_at > ?", 15.minutes.ago) }


	def self.reg (country)
		Carmen::Country.coded(country).subregions.map { |s| [s.name, s.code] }
	end

	def full_name
		"#{name} #{surname}"
	end

	def online
		updated_at > 15.minutes.ago 
	end
  
end
