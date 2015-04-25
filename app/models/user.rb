class User < ActiveRecord::Base
	has_and_belongs_to_many :groups
	attr_accessor :group_id, :users

	validates :name, :gender, :email, presence: true
	validates :email, uniqueness: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
end
