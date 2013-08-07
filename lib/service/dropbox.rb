require 'dropbox_sdk'

class Service::Dropbox < Service::FileService
  attr_accessor :filename_list

  def initialize path
    self.path = path || '/'
    fetch_file
  end

  def fetch_file
    flow = DropboxOAuth2FlowNoRedirect.new(ENV['DROPBOX_APP_KEY'], ENV['DROPBOX_APP_SECRET'])
    @client = DropboxClient.new(ENV['DROPBOX_ACCESS_TOKEN'])
    @metadata = @client.metadata(path)
    if @metadata['is_dir']
      contents = @client.metadata(path)['contents']
      file_names = contents.map{|h| h['path']}.map{|path| filename_from(path) }
      @filename_list = file_names
    else
      @filename_list = [path]
    end
  end

  def text_file?
    mime_type == "application/octet-stream"
  end

  def mime_type
    @metadata['mime_type']
  end

  def file
    contents, metadata = @client.get_file_and_metadata(path)
    contents
  end

  def directory?
    @metadata['is_dir']
  end

  def filename_from path
    path.match( /[^\/]*$/ )[0]
  end
end
