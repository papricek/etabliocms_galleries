class AddAttachableToGalleries < ActiveRecord::Migration

  def change
    add_column :galleries, :attachable_type, :string
    add_column :galleries, :attachable_id, :integer
  end

end
