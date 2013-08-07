class Service::LocalFileSystem < Service::FileService
  NOTES_DIR = 'public/notes/'

  def initialize path
    self.path = path
  end

  def file_list
    @file_list = list path_filename
  end

  def file
    @file_list[0]
  end

  def renderable?
    @file_list.count == 1 && File.file?(@file_list[0])
  end

  private

  def path_filename
    NOTES_DIR + (@path || "")
  end

  def list dir
    path = dir || ""
    if File.directory? path
      entries = Dir.entries(path)
      entries.reject!{|f| f =~ /^\./}
      filter_markdown_files(path, entries)
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
