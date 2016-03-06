class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.belongs_to :conference
      t.belongs_to :account
      t.integer :status, default: 0
      t.string :message
      t.string :answer
      t.timestamps null: false
    end
  end
end
