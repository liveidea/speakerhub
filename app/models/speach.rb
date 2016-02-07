class Speach < ActiveRecord::Base
	has_many :themes
	belongs_to :user
	belongs_to :conference

end
