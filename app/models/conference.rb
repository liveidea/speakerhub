class Conference < ActiveRecord::Base
	belongs_to :user
	has_many :speeches
	validates :place, presence: true
	validates :title, presence: true
	validate :date_validation

	scope :title, -> (title_s) {where(:title => title_s)}
	scope :start_date, -> (start_date_s) {where(:start_date => start_date_s)}
	scope :finish_date, -> (finish_date_s) {where(:finish_date => finish_date_s)}
private
def date_validation
	if self[:start_date] > self[:finish_date]
		errors[:start_date] = "cant be later than finish date"
		return true
	else
		return false
	end
end
end
