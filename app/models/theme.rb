class Theme < ActiveRecord::Base
	belongs_to :speech
  has_and_belongs_to_many :users
end
