require "mime/types"
class Service::LocalFileSystem < Service::FileService
  NOTES_DIR = 'public/notes/'

  def initialize path
    @path = path
    @files_list = list path_filename

    text_plain = MIME::Types['text/plain'].first.to_hash
    text_plain['Extensions'].push('md')
    MIME::Types.add(MIME::Type.from_hash(text_plain))
  end

  def file
    File.read( @files_list[0] )
  end

  def directory?
    @is_directory
  end

  def text_file?
    if mime_type.present?
      ['text/plain'].include? mime_type
    else
      false
    end
  end

  def mime_type
    MIME::Types.type_for(path).first.try :content_type
  end

  def path_filename
    NOTES_DIR + (@path || "")
  end


  private

  def list dir
    @folders_list = []
    path = dir || ""
    if File.directory? path
      @is_directory = true
      @folders_list = Dir.entries(path).select {|entry| File.directory?(File.join(path, entry)) && !hidden_file?(entry) }
      Dir.entries(path).reject {|entry| File.directory?(File.join(path, entry)) || hidden_file?(entry) }
    else
      @is_directory = false
      [ path ]
    end
  end

  def hidden_file? filename
    # starting with a '.'
    filename =~ /^[\.].*/
  end

  def filter_markdown_files path, entries
    entries.select do |e|
      if File.directory?(path + "/" + e)
        true
      else
        e =~ /.*\.md$/
      end
    end
  end

end
