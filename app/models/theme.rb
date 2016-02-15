class Theme < ActiveRecord::Base
	has_many :speeches
  has_and_belongs_to_many :users
end
