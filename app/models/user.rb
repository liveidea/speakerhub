class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :conferences
   has_many :speeches
   belongs_to :account
   attr_accessor :f_name, :l_name
   after_create :account_create

  def total_speeches
   speeches.size
  end

  def account_create
   self.create_account(f_name: f_name, l_name: l_name)
   self.save
  end


end
