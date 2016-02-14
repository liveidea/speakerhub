class Account < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end
