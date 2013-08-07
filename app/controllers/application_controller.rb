class ApplicationController < ActionController::Base

  protect_from_forgery

  def browse
    file_service = Service::FileService.get_file_service(params[:path])

    if file_service.directory? 
      @filename_list = file_service.filename_list
      @directory = params[:path]
    else
      if file_service.text_file?
        html = RDiscount.new(file_service.file).to_html
        render :text => html, :layout => "application"
      else
        send_data file_service.file, :type => file_service.mime_type, :disposition => 'inline'
      end
    end
  end

end
