class Account < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  attr_accessor :city_id
  has_one :user
  before_save :save_city
  private
  def save_city
    self.user.update_attribute(:city_id, city_id)
  end
end
