module EtabliocmsGalleries
  class Gallery < ActiveRecord::Base

    default_scope :order => "position asc"

    attr_accessor :attachable_temp
    belongs_to :attachable, :polymorphic => true
    before_save :set_attachable
    before_save :set_pictures
    attr_accessor :pictures_array

    scope :visible, where(:visible => true)

    validates :title, :presence => true

    has_slug
    has_paper_trail

    has_many :pictures, :order => 'position asc', :dependent => :destroy, :class_name => 'EtabliocmsGalleries::Picture'
    accepts_nested_attributes_for :pictures, :allow_destroy => true

    def set_pictures
      if pictures_array.present?
        pictures_array.each do |file|
          pictures.build(:data => file,
                         :title => file.original_filename,
                         :position => pictures_array.index(file))
        end
      end
    end

    def self.attachables_for_select
      sum = []
      sum += EtabliocmsPages::Page.all if defined?(EtabliocmsPages)
      EtabliocmsGalleries.attachables.each { |string| sum += eval(string) } if EtabliocmsGalleries.attachables.present?

      sum.map { |item|
        title = item.is_a?(EtabliocmsPages::Page) ? "#{'&nbsp;'*2*item.level}#{item.title}" : item.title
        ["#{I18n.t("activerecord.attributes.#{item.class.to_s.underscore}.class_name")}: #{title}".html_safe, "#{item.class}##{item.id}"] }
    end

    private
    def set_attachable
      return if attachable_temp.blank?
      attachable_type, attachable_id = attachable_temp.to_s.split("#")
      if attachable_type.present? and attachable_id.present?
        self.attachable_type = attachable_type
        self.attachable_id = attachable_id
      else
        self.attachable = nil
      end
    end
  end
end
