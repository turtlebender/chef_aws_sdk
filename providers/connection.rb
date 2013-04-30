def _install
  %w{ libxml2-dev libxslt1-dev build-essential }.each do |pkg|
    install_package = package pkg
    install_package.run_action :install
  end

  chef_gem 'aws-s3' do
    action :remove
  end

  chef_gem 'aws-sdk' do
    action :install
  end
end

action :install do
  _install
end

action :configure do

  _install
  require "aws"

  config = {}
  if @new_resource.access_key_id && @new_resource.secret_access_key
    config[:access_key_id] = @new_resource.access_key_id
    config[:secret_access_key] = @new_resource.secret_access_key
  end

  AWS.config(config)
end
