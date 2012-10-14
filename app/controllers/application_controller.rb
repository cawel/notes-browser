class ApplicationController < ActionController::Base
  protect_from_forgery

  def welcome
  end

  def browse
    params[:level1] = nil if params[:level1] == 'root'
    path = params[:level1]
    path += "/#{params[:level2]}" if params[:level2]
    @files = file_list(path)

    if @files.count == 1 && @files[0].file?
      render :text => @files[0]
    end
  end

  private
  def file_list dir
    dir = "" if dir.nil?
    entries = Dir.entries("public/browser/" + dir)
    entries.reject{|f| f =~ /^\./}
  end
end
