# encoding: utf-8

class HomeGalleryImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def custom_rename
    #HomeGalleryImage.all.each {|item| FileUtils.mv(item.image.file.file, "#{item.image.file.file}.jpg") if File.exist?(item.image.path); ion_name| FileUtils.mv(item.image.versions[version_name].path, "#{item.image.versions[version_name].path}.jpg") if File.exist?(item.image.versions[version_name].path) }; ActiveRecord::Base.connection.execute("update #{item.class.table_name} set image= \"#{item['image']}.jpg\" where id=#{item.id}") }
    HomeGalleryImage.all.each {|item| FileUtils.mv(item.image.file.file, "#{item.image.file.file}.jpg") if File.exist?(item.image.path); item.image.versions.keys.each {|version_name| FileUtils.mv(item.image.versions[version_name].path, "#{item.image.versions[version_name].path}.jpg") if File.exist?(item.image.versions[version_name].path) }; ActiveRecord::Base.connection.execute("update #{item.class.table_name} set image= \"#{item['image']}.jpg\" where id=#{item.id}") }
  end

  def custom_rename_on_server
    HomeGalleryImage.all.each {|item| new_name = item.image.file.file; old_name = new_name[0, new_name.length - 4];  FileUtils.mv(old_name, new_name) if File.exist?(old_name); item.image.versions.keys.each {|version_name| version_new_file_name = item.image.versions[version_name].path; version_old_file_name = version_new_file_name[0, version_new_file_name.length - 4]; FileUtils.mv(version_old_file_name, version_new_file_name) if File.exist?(version_old_file_name) }; }
    RoomGalleryImage.all.each {|item| new_name = item.image.file.file; old_name = new_name[0, new_name.length - 4];  FileUtils.mv(old_name, new_name) if File.exist?(old_name); item.image.versions.keys.each {|version_name| version_new_file_name = item.image.versions[version_name].path; version_old_file_name = version_new_file_name[0, version_new_file_name.length - 4]; FileUtils.mv(version_old_file_name, version_new_file_name) if File.exist?(version_old_file_name) }; }
    ServiceGalleryImage.all.each {|item| new_name = item.image.file.file; old_name = new_name[0, new_name.length - 4];  FileUtils.mv(old_name, new_name) if File.exist?(old_name); item.image.versions.keys.each {|version_name| version_new_file_name = item.image.versions[version_name].path; version_old_file_name = version_new_file_name[0, version_new_file_name.length - 4]; FileUtils.mv(version_old_file_name, version_new_file_name) if File.exist?(version_old_file_name) }; }
    AboutPageGalleryImage.all.each {|item| new_name = item.image.file.file; old_name = new_name[0, new_name.length - 4];  FileUtils.mv(old_name, new_name) if File.exist?(old_name); item.image.versions.keys.each {|version_name| version_new_file_name = item.image.versions[version_name].path; version_old_file_name = version_new_file_name[0, version_new_file_name.length - 4]; FileUtils.mv(version_old_file_name, version_new_file_name) if File.exist?(version_old_file_name) }; }
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  version :home_gallery_thumb do
    process resize_to_fill: [138, 100]
  end

  version :home_gallery_large do
    process resize_to_fill: [800, 600]
  end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
