class CreateAccounts < ActiveRecord::Migration
  def change
  	add_column :users, :account_id, :integer
    add_column :conferences, :user_id, :integer
    #t.belongs_to :user
    create_table :accounts do |t|
      t.string :f_name
      t.string :l_name
      t.string :phone
      t.string :facebook_account
      t.string :skype_account
      t.timestamps null: false
    end
  end
end
