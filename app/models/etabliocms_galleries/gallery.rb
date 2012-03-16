module EtabliocmsGalleries
  class Gallery < ActiveRecord::Base

    default_scope :order => "position asc"

    scope :visible, where(:visible => true)

    validates :title, :presence => true

    has_slug
    has_paper_trail

    has_many :pictures, :order => 'position asc', :dependent => :destroy, :class_name => 'EtabliocmsGalleries::Picture'
    accepts_nested_attributes_for :pictures, :allow_destroy => true

  end
end
