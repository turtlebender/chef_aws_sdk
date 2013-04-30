actions :download

attribute :bucket, :kind_of => String, :required => true
attribute :key, :kind_of => String, :required => true
attribute :name, :kind_of => String, :required => true, :name_attribute => true
attribute :owner, :kind_of => String
attribute :group, :kind_of => String

default_action :download
