template "/etc/nginx/sites-available/test" do
  source "site.erb"
  mode 0777
  owner "root" #node.nginx.user
  group "root" #node.nginx.user
end

nginx_site "test"

