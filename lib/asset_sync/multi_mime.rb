require 'mime/types'

module AssetSync
  class MultiMime

    def self.lookup(ext)
      
      ext_with_dot = ".#{ext}"
      
      if defined?(Mime::Type) and !Mime::Type.lookup_by_extension(ext).nil?
        Mime::Type.lookup_by_extension(ext)
      elsif defined?(Rack::Mime) and !Rack::Mime.mime_type(ext_with_dot).nil?
        Rack::Mime.mime_type(ext_with_dot)
      else
        ::MIME::Types.type_for(ext).first
      end

    end

  end
end
