class AddColumnToSpeeches < ActiveRecord::Migration
  def change
  	add_column    :speeches, :available,  :boolean
  end
end
