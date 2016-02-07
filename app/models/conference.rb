class Conference < ActiveRecord::Base
	belongs_to :user
	has_many :speaches
end
