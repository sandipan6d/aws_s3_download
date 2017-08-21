# This recipe helps to download object from S3 bucket, keeping into consideration
# EC2 is having Role to download object from S3



s3_bucket_name = node['aws']['s3.bucket.name']
s3_object_name = node['aws']['s3.object.name']
src_filepath = node['aws']['file.download.path']
extract_path = "#{src_filepath}/#{s3_object_name}"
key_id = node['aws_s3_download']['key_id']
access_key = node['aws_s3_download']['access_key']

bash "download_#{s3_object_name}" do
  cwd ::File.dirname(src_filepath)
  code <<-EOH
   source /root/.bashrc
   aws --version
    export AWS_ACCESS_KEY_ID=#{key_id}
    export AWS_SECRET_ACCESS_KEY=#{access_key}
   aws s3 cp s3://#{s3_bucket_name}/#{s3_object_name} #{src_filepath}/#{s3_object_name}
  EOH
  not_if { ::File.exist?(extract_path) }
end

