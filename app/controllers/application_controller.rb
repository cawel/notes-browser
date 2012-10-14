class ApplicationController < ActionController::Base
  protect_from_forgery

  def welcome
  end

  def browse
    params[:level1] = nil if params[:level1] == 'root'
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
    dir = "" if dir.nil?
    path = "app/views/notes/" + dir
    if File.directory? path
      entries = Dir.entries(path)
      entries.reject{|f| f =~ /^\./}
    else
      [ path ]
    end
  end
end
