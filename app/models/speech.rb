class Speech < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :conference
  belongs_to :theme

  has_many :comments, as: :commentable

  validates :date, presence: true
  validates :title, presence: true

  scope :location,    -> (city)  { where place: city }
  scope :theme,       -> (theme) { where theme: theme }
end
