class Account < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  # attr_accessor :city_id
  # attr_accessor :theme_ids
  has_one :user
  has_and_belongs_to_many :themes
  has_many :comments
  # before_save :save_params
  has_many :requests
  belongs_to :city
  scope :name_search, -> (name_s) { where("f_name LIKE ? or l_name LIKE ? or concat(f_name, ' ', l_name) LIKE ?", "%#{name_s}%", "%#{name_s}%", "%#{name_s}%") }
end
