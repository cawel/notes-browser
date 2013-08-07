class PagesController < ApplicationController

  def edit
    content = File.read(@file_service.path_filename)
    @page = Page.new(content: content)
  end

  def update
    content = params[:page][:content] 
    File.open(@file_service.path_filename, 'w') { |file| file.write(content) }
    redirect_to browser_path(path: params[:path])
  end
end
