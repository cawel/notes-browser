require "mime/types"
class Service::LocalFileSystem < Service::FileService
  NOTES_DIR = 'public/notes/'

  def initialize path
    self.path = path
    @filename_list = list path_filename

    text_plain = MIME::Types['text/plain'].first.to_hash
    text_plain['Extensions'].push('md')
    MIME::Types.add(MIME::Type.from_hash(text_plain))
  end

  def file
    File.read( @filename_list[0] )
  end

  def directory?
    !( @filename_list.count == 1 && File.file?(@filename_list[0]) )
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
    path = dir || ""
    if File.directory? path
      entries = Dir.entries(path)
      entries.reject!{|f| f =~ /^\./}
      # filter_markdown_files(path, entries)
    else
      [ path ]
    end
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
