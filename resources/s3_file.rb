actions :download

attribute :bucket, :type => String, :required => true
attribute :key, :type => String, :required => true
attribute :path, :type => String, :required => true, :name_attribute => true
attribute :owner, :type => String
attribute :group, :type => String

default_action :download
