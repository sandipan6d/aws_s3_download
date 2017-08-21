#
# Cookbook:: aws_s3_download
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.


include_recipe 'aws_s3_download::install_aws_cli'
include_recipe 'aws_s3_download::download_s3_object'
