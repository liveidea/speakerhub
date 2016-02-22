class AddAvaliableToConferences < ActiveRecord::Migration
  def change
    add_column :conferences, :avaliable, :boolean
  end
end
