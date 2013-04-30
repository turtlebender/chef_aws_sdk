# Download a file from s3 and store it locally
# Requires a bucket, key and local path in which to store the file.
action :download do
  ruby_block "download s3://#{@new_resource.bucket}/#{@new_resource.key}" do
    block do
      File.open(@new_resource.local_file, 'w') do |file|
        obj.read do |chunk|
          file.write(chunk)
        end
      end
    end
    not_if "test -f #{@new_resource.local_file}"
  end
end

action :upload do
  log 'Upload doesn\'t currently do anything'
end
