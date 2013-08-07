class Service::FileService
  attr_accessor :path

  def self.get_file_service path
    # LocalFileSystem.new path
    Service::Dropbox.new path
  end
end
