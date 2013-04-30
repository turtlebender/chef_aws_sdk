aws_sdk Cookbook
================

This is designed to make using the aws-sdk libraries easier from within
a chef cookbook. Most of what is here is here for historical reasons,
since the right_aws gem can do most of the same tasks

The cookbook supplies two resource providers (ATM):

aws_connection

and

s3_file

aws_connection
--------------

aws_connection provides the boilerplate code for connecting up with the
aws apis.

To use it, you can either provide credentials like this:

aws_connection 'base' do
  action :install, :configure
  access_key_id <MyAccessKeyID>
  secret_access_key <MySecretAccesKey>
end

and it will connect to aws using the supplied credentials, or, if you
are running on an ec2 instance with an instance profile role, you can
just leave the credentials out:

aws_connection 'base' do
  action :install, :configure
end

and the instance profile will be used to connect.


s3_file
--------

At the moment, only downloading a file is supported. The s3_file
provider assumes that the aws connection has already been configured.

aws_sdk_s3_file '/opt/packages/mypackage.tar.gz' do
  action :download
  bucket 'mybucket'
  key 'mypackage.tar.gz'
end

The file will be stored at the name attribute

Contributing
------------

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Tom Howe
