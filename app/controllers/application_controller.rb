class ApplicationController < ActionController::Base

  protect_from_forgery

  NOTES_DIR = 'public/notes/'

  def browse
    @directory = params[:path]
    @file_list = file_list(path_filename)

    if @file_list.count == 1 && File.file?(@file_list[0])
      render @file_list[0]
    end
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
