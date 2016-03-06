class ChangeRelationBetweenSpeechAndTheme < ActiveRecord::Migration
  def change
  	remove_column :themes,   :speech_id, :integer
  	add_column    :speeches, :theme_id,  :integer
  end
end
