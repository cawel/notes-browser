module ApplicationHelper
  def file_link file
    path = "/browser"
    unless params[:level1].nil?
      path += "/#{params[:level1]}"
    end
    unless params[:level2].nil?
      path += "/#{params[:level2]}"
    end
    unless params[:level3].nil?
      path += "/#{params[:level3]}"
    end
    path += "/#{file}"
  end
end
