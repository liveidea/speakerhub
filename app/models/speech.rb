class Speech < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	belongs_to :user
	belongs_to :conference
	belongs_to :theme
	validates :date, presence: true
end
