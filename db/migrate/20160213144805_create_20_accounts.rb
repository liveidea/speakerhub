class Create20Accounts < ActiveRecord::Migration
  def change
    20.times do |i|
      User.create(f_name: "user#{i}", email: "user#{i}@test.com", password: "user12345",
       encrypted_password: User.new.send(:password_digest, "user12345"))
    end
  end
end
