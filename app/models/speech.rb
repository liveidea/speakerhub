class Speech < ActiveRecord::Base
	belongs_to :user
	belongs_to :conference
	has_many :themes
end
