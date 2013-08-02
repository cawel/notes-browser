module ApplicationHelper

  def file_link file
    path = "/browser"
    if @directory.present?
      path += "/#{@directory}"
    end
    path += "/#{file}"
  end

  def breadcrumb_link memo, segment
    path = if memo.blank?
             segment
           else
             memo + '/' + segment
           end
    "/browser" + "/#{path}"
  end

end
