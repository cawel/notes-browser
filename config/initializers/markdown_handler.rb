module MarkdownHandler

  def self.erb
    @erb ||= ActionView::Template.registered_template_handler(:erb)
  end

  def self.call(template)
    compiled_source = erb.call(template)

    # trick to have the correct url for images in markdown source
    # assuming the image is in the same location as the notes file
    begin
      path = template.inspect
      path.gsub!('public', '')
      # take everything up to the last slash
      image_path_base = path.match(/.*\//)[0]
      compiled_source.gsub!("](", "](" + image_path_base)
    rescue
      # fail silently since this is a fragile hack
    end

    "RDiscount.new(begin;#{compiled_source};end).to_html"
    ''
  end
end

# ActionView::Template.register_template_handler :md, MarkdownHandler
