template "/etc/nginx/sites-available/site" do
  source "config.erb"
  mode 0777
  owner node.nginx.user
  group node.nginx.user
end

nginx_site "site"

package "php5-mysql" do
  action :install
end
