class Request < ActiveRecord::Base
  belongs_to :account
  belongs_to :conference, dependent: :destroy
  validates :message, presence: true, on: :create
  validates :answer, presence: {message: "Comment field can't be empty"}, on: :update
  validates :status, inclusion: { in: ["accepted", "declined"], message: "Please accept or deny a request"}, on: :update
  enum status: [:in_process, :accepted, :declined]
end
