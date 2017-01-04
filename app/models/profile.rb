class Profile < ApplicationRecord
	validates :name, :age, :address, :phone, presence: true
	belongs_to :user
end
