# This migration comes from etabliocms_galleries_engine (originally 20120316153055)
class CreatePictures < ActiveRecord::Migration

  def change
    create_table :pictures do |t|
      t.string :title, :null => false
      t.text :text

      t.string :data_file_name
      t.string :data_content_type
      t.integer :data_file_size
      t.datetime :data_updated_at

      t.integer :gallery_id, :null => false
      t.integer :position, :default => 0

      t.timestamps
    end

  end

end

