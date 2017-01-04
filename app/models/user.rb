class User < ApplicationRecord
	validates :rol, :username, :email, :pass, presence: true
	has_one :profile, :foreign_key => 'user_id', :dependent => :destroy
	has_one :history, :foreign_key => 'user_id', :dependent => :destroy
end
