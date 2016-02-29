class Request < ActiveRecord::Base
  belongs_to :account
  belongs_to :conference
  validates :message, presence: true, on: :create
  validates :answer, presence: true, on: :update
  validates :status, inclusion: { in: ["Accepted", "Declined"]}, on: :update
  enum status: ["In process", :Accepted, :Declined]
end
