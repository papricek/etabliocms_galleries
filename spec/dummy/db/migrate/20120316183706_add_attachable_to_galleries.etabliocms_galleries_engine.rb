# This migration comes from etabliocms_galleries_engine (originally 20120316190255)
class AddAttachableToGalleries < ActiveRecord::Migration

  def change
    add_column :galleries, :attachable_type, :string
    add_column :galleries, :attachable_id, :integer
  end

end
