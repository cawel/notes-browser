class Service::FileService
  attr_accessor :path
  attr_accessor :files_list
  attr_accessor :folders_list

  def self.get_file_service path
    # Service::LocalFileSystem.new path
    Service::Dropbox.new path
  end
end
