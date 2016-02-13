class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
    	t.string :title
    	t.text :description
    	t.string :place
    	t.datetime :date
#    	t.belongs_to :user
      t.timestamps null: false
    end
  end
end
