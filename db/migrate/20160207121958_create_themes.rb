class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
    	t.string :theme
    	t.belongs_to :speach
    	t.belongs_to :user
     t.timestamps null: false
    end
  end
end
