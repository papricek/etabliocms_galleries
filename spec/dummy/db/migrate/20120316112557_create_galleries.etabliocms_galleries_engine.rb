# This migration comes from etabliocms_galleries_engine (originally 20120316132855)
class CreateGalleries < ActiveRecord::Migration

  def change
    create_table :galleries do |t|
      t.string :title, :null => false
      t.string :slug, :null => false
      t.text :text

      t.boolean :visible
      t.integer :position, :default => 0

      t.timestamps
    end

  end

end

