class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   belongs_to :city
   has_many :conferences
   has_many :speaches
   has_many :themes


   def speech? #some calual method for tests, that isnt supposed to do anything special
     self.speaches.any?
   end
end
