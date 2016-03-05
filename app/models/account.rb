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
  scope :name_search, -> (name_s) {where("f_name LIKE ? or l_name LIKE ? or concat(f_name, ' ', l_name) LIKE ?", "%#{name_s}%", "%#{name_s}%" , "%#{name_s}%")}

  private

  # def save_params
  #   # self.user.update_attribute(:city_id, city_id)
  #   self.themes.push(valid_theme_ids)
  # end
  #
  # def valid_theme_ids
  #   theme_ids.map! {|i| i.to_i}
  #   themes = Theme.where(id: (theme_ids - self.user.theme_ids))
  # end

end
