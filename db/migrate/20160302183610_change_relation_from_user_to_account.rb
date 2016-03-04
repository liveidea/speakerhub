class ChangeRelationFromUserToAccount < ActiveRecord::Migration
  def change
    remove_column :users, :city_id
    add_column :accounts, :city_id, :integer
    rename_column :themes_users, :user_id, :account_id
    rename_table :themes_users, :accounts_themes
  end
end
