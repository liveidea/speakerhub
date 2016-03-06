class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
    	t.string :name
    	t.belongs_to :speech
     t.timestamps null: false
    end
  end
end
