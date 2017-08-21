src_filepath = node['centos']['command.execute.path']
aws_runtime_path = '/root/.local/bin/aws'

bash 'install_awscli' do
  cwd ::File.dirname(src_filepath)
  code <<-EOH
   yum install -y update
   yum -y install epel-release
   yum -y install python-pip
   pip install awscli --upgrade --user
   echo "export PATH=~/.local/bin:$PATH" >> ~/.bashrc
   source ~/.bashrc
   aws --version
  EOH
  not_if { ::File.exist?(aws_runtime_path) }
end
