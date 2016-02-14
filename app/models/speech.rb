class Speech < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	belongs_to :user
	belongs_to :conference
	has_many :themes
	validates :date, presence: true
end
