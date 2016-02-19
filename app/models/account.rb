class Account < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  attr_accessor :city
  has_one :user
end
