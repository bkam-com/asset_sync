require 'mime/types'

module AssetSync
  class MultiMime

    def self.lookup(ext)

      if defined?(Mime::Type) and !Mime::Type.lookup_by_extension(ext).nil?
        Mime::Type.lookup_by_extension(ext)
      elsif defined?(Rack::Mime) and !Rack::Mime.mime_type(".#{ext}").nil?
        ext_with_dot = ".#{ext}"
        Rack::Mime.mime_type(ext_with_dot)
      else
        ::MIME::Types.type_for(ext).first
      end

    end

  end
end
