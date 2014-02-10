nginx_site 'default' do
  action :disable
end

#%w(public logs).each do |dir|
#  directory "#{node.app.web_dir}/#{dir}" do
#    owner node.user.name
#    mode "0755"
#    recursive true
#  end
#end

template "#{node.nginx.dir}/sites-available/test" do
  source "site.erb"
  mode 0777
  owner node.nginx.user
  group node.nginx.user
end

nginx_site "test"

#cookbook_file "#{node.app.web_dir}/public/index.html" do
#  source "index.html"
#  mode 0755
#  owner node.user.name
#end
