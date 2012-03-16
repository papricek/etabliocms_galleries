module EtabliocmsGalleries
  class Gallery < ActiveRecord::Base

    default_scope :order => "position asc"

    scope :visible, where(:visible => true)

    validates :title, :presence => true

    has_slug
    has_paper_trail

  end
end
