class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   belongs_to :city
   has_many :conferences
   has_many :speeches
   has_and_belongs_to_many :themes
   belongs_to :account
   attr_accessor :f_name, :l_name
   after_create :account_create

   def total_speeches
     speeches.size
   end

   def account_create
     self.create_account(f_name: f_name, l_name: l_name)
     self.save
     binding.pry
   end


end
