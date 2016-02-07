class Conference < ActiveRecord::Base
	belongs_to :user
	has_many :speaches
	validates :place, presence: :true
	validates :title, presence: :true

end
