class CreateSpeeches < ActiveRecord::Migration
  def change
    create_table :speeches do |t|
    	t.string :title
    	t.text :description
    	t.string :place
    	t.datetime :date
    	t.string :image
    	t.string :video
    	t.belongs_to :user
    	t.belongs_to :conference
      t.timestamps null: false
    end
  end
end
