class ApplicationController < ActionController::Base
  before_filter :deal_with_root

  protect_from_forgery

  def welcome
  end

  def browse
    path = params[:level1]
    path += "/#{params[:level2]}" if params[:level2]
    path += "/#{params[:level3]}" if params[:level3]
    @files = file_list(path)

    if @files.count == 1 && File.file?(@files[0])
      render @files[0]
    end
  end

  private

  def file_list dir
    path = "notes/" + (dir || "")
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

  def deal_with_root
    params[:level1] = nil if params[:level1] == 'root'
  end

end
