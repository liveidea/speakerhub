class Comment < ActiveRecord::Base
	belongs_to :account
	belongs_to :commentable, polymorphic: true

	validates :description, presence: true
	validates :description, length: {
    minimum: 10,
    maximum: 300,
    too_short: "must have at least 1 letter",
    too_long: "must have at most %{count} words"
  }
end
