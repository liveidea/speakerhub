class AddEndDateToConferences < ActiveRecord::Migration
  def change
    add_column :conferences, :finish_date, :date
    rename_column :conferences, :date, :start_date
    change_column :conferences, :finish_date, :date
  end
end
