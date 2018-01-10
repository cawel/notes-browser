class ApplicationController < ActionController::Base
  protect_from_forgery

  require 'github/markup'

  def browse
    file_service = Service::FileService.get_file_service(params[:path])

    if file_service.directory?
      @files_list = file_service.files_list
      @folders_list = file_service.folders_list
    end

    if file_service.file?
      if file_service.text_file?
        render text: convert_to_html(file_service.file), layout: 'application'
      else
        # directories or binary files e.g. images
        send_data(file_service.file, type: file_service.file_extension, disposition: 'inline')
      end
    end
  end

  #
  # Private methods
  #

  private

  def convert_to_html(file)
    GitHub::Markup.render('dummy.md', file)
  end
end
