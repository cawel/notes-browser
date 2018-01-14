class Dropbox
  attr_accessor :path

  def initialize(path)
    self.path = path.present? ? ('/' + path) : ''
    fetch_file
  end

  def fetch_file
    @client = DropboxApi::Client.new
    @metadata = @client.get_metadata(path) if path.present?
    @directory_listing = @client.list_folder(path) if directory?
  end

  def files_list
    files.map(&:name)
  end

  def folders_list
    folders.map(&:name)
  end

  def text_file?
    file? && (%w[md txt].include? file_extension)
  end

  def file_extension
    @metadata.path_lower =~ /\.(.*)$/ ? Regexp.last_match(1) : ''
  end

  def file
    file_contents = ''
    @client.download(@metadata.path_lower) do |chunk|
      file_contents << chunk
    end
    file_contents
  end

  def directory?
    root_directory? || @metadata.is_a?(DropboxApi::Metadata::Folder)
  end

  def file?
    @metadata.is_a?(DropboxApi::Metadata::File)
  end

  #
  # Private methods
  #

  private

  def root_directory?
    path == ''
  end

  def folders
    @directory_listing.entries.select { |e| e.is_a? DropboxApi::Metadata::Folder }
  end

  def files
    @directory_listing.entries.select { |e| e.is_a? DropboxApi::Metadata::File }
  end
end
