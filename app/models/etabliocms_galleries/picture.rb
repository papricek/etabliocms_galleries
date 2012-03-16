module EtabliocmsGalleries
  class Picture < ActiveRecord::Base

    default_scope :order => 'position asc'

    has_paper_trail

    belongs_to :gallery, :class_name => 'EtabliocmsGalleries::Gallery', :foreign_key => 'gallery_id'

    has_attached_file :data,
                      :styles => {
                        :large => EtabliocmsGalleries.try(:paperclip_large) || "800x800>",
                        :medium => EtabliocmsGalleries.try(:paperclip_medium) || "400x400>",
                        :thumbnail => EtabliocmsGalleries.try(:paperclip_thumbnail) || "100x100>"
                      }

  end
end
