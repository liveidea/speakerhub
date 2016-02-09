class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   belongs_to :city
   has_many :conferences
   has_many :speeches
   has_and_belongs_to_many :themes
   validates :f_name, presence: true

   def total_speeches
     speeches.size
   end


end
