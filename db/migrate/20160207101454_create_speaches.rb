class CreateSpeaches < ActiveRecord::Migration
  def change
    create_table :speaches do |t|
    	t.string :title
 	    t.text :description
    	t.datetime :date
    	t.string :image
    	t.string :video
    	t.belongs_to :user
    	t.belongs_to :conference
      t.timestamps null: false
    end
  end
end
