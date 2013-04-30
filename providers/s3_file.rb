# Download a file from s3 and store it locally
# Requires a bucket, key and local path in which to store the file.
action :download do
  unless exists?
    s3_download_file = Tempfile.new('s3')
    obj.read do |chunk|
      s3_download_file.write(chunk)
    end
    s3_download_file.rewind()
    move_and_clean_up s3_download_file
    new_resource.updated_by_last_action(true)
  end
end

private

def exists?
  ::File.exists?(new_resource.path)
end

def move_and_cleanup(s3_download_file)
  Chef::Log.info("#{@new_resource} download completed")
  f = file @new_resource.path do
    content s3_download_file.read()
    backup false
    owner new_resource.owner
    group new_resource.group
  end
  f.run_action(:create)
  s3_download_file.close
  s3_download_file.unlink    # deletes the temp file
end
