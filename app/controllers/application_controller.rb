class ApplicationController < ActionController::Base
  before_filter :load_file_service
  protect_from_forgery

  require 'github/markup'

  def browse
    if @file_service.directory?
      @files_list = @file_service.files_list
      @folders_list = @file_service.folders_list
      @directory = params[:path]
    else
      if @file_service.text_file?
        # Render it to HTML and mark it as safe to avoid auto escaping
        html = GitHub::Markup.render('dummy.md', @file_service.file).html_safe

        render text: html, layout: 'application'
      else
        # directories or binary files e.g. images
        send_data @file_service.file, type: @file_service.file_extension, disposition: 'inline'
      end
    end
  end

  #
  # Private methods
  #

  private

  def load_file_service
    @file_service = Service::FileService.get_file_service(params[:path])
  end
end
