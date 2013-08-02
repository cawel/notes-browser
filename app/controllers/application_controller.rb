class ApplicationController < ActionController::Base

  protect_from_forgery

  NOTES_DIR = 'public/notes/'

  def browse
    @files = file_list(path_filename)

    if @files.count == 1 && File.file?(@files[0])
      render @files[0]
    end
    @directory = params[:path]
  end


  private

  def path_filename
    NOTES_DIR + (params[:path] || "")
  end

  def file_list dir
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
