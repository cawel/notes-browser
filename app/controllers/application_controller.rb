class ApplicationController < ActionController::Base
  before_filter :load_file_service

  protect_from_forgery

  def browse

    if @file_service.directory? 
      @files_list = @file_service.files_list
      @folders_list = @file_service.folders_list
      @directory = params[:path]
    else
      if @file_service.text_file?
        html = RDiscount.new(@file_service.file).to_html
        render :text => html, :layout => "application"
      else
        # directories or binary files e.g. images
        send_data @file_service.file, :type => @file_service.mime_type, :disposition => 'inline'
      end
    end
  end

  private
  def load_file_service
    @file_service = Service::FileService.get_file_service(params[:path])
  end

end
