class ImageUploader < Shrine
    plugin :default_url

    plugin :determine_mime_type, analyzer: -> (io, analyzers) do
        mime_type = analyzers[:marcel].call(io, filename_fallback: true)
    end

    Attacher.default_url do |**options|
        "/placeholders/Ждун.jpg"
    end
end