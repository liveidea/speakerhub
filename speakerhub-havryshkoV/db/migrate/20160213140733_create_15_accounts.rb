class Create15Accounts < ActiveRecord::Migration
  def change
  	15.times do |i|
  		User.create(f_name: "user#{i}", password: "user12345",email: "user#{i}@email.com", encrypted_password: User.new.send(:password_digest, "user12345"))
  	end
  end
end
