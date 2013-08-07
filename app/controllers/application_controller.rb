class ApplicationController < ActionController::Base

  protect_from_forgery

  def browse
    file_service = FileService.get_file_service(params[:path])
    @file_list = file_service.file_list

    if file_service.renderable? 
      render file_service.file
    else
      @directory = params[:path]
    end
  end

end
