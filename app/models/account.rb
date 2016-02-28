class Account < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  attr_accessor :city_id
  attr_accessor :theme_ids
  has_one :user
  has_many :themes, through: :user

  has_many :comments


  before_save :save_city
  before_save :save_params
  scope :name_search, -> (name_s) {where("f_name LIKE ? or l_name LIKE ? or concat(f_name, ' ', l_name) LIKE ?", "%#{name_s}%", "%#{name_s}%" , "%#{name_s}%")}
  private
    def save_params
      self.user.update_attribute(:city_id, city_id)
      theme_ids.delete_at(0)
      self.user.themes.push(Theme.find(theme_ids))
    end
    def save_city
      self.user.update_attribute(:city_id, city_id)
    end
end
