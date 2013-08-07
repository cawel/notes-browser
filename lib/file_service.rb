class FileService
  def self.get_file_service path
    LocalFileSystem.new path
  end
end
