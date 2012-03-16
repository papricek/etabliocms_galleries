class AddAttachableToGalleries < ActiveRecord::Migration

  def up
    add_column :galleries, :attachable_type, :string
    add_column :galleries, :attachable_id, :integer
  end

  def down
    remove_column :galleries, :attachable_type
    remove_column :galleries, :attachable_id
  end

end
