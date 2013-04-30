actions :download, :upload

attribute :bucket, :type => String, :required => true
attribute :key, :type => String, :required => true
attribute :local_file, :type => String, :required => true, :name_attribute => true

default_action :download
