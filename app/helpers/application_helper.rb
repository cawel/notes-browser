module ApplicationHelper

  def file_link file
    path = "/browser"
    if @directory.present?
      path += "/#{@directory}"
    end
    path += "/#{file}"
  end

end
