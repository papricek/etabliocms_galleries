require "active_support/dependencies"

module EtabliocmsGalleries

  mattr_accessor :paperclip_large
  mattr_accessor :paperclip_medium
  mattr_accessor :paperclip_thumbnail

  def self.setup
    yield self
  end

end

require "etabliocms_galleries/engine"
require "form_helper"
