#
# Cookbook Name:: dev_virtual_machine
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
gem_package "ruby-shadow"

directory "/home/#{node[:user]}/.ssh" do
  owner node[:user]
  group node[:user]
  mode 0700
end

file "/home/#{node[:user]}/.ssh/authorized_keys" do
  owner node[:user]
  group node[:user]
  mode 0600
  action :create_if_missing
  content "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA5mX2JV6T6CVCRmTlC9vrpgEQp259XQYBKIkhWeHtJXGe8bV6RWxR07deny/coS3OZ0TcM8nXb3J3mykaF1xAK+9nXljcIJy76Us9bjXS25UVXQ18DMOQ0mKR3u29jYjw0TCGBUZxjpOTiUudCoAI7i3XHanQz0vyQaKOhDa1fDb3Qc4hKujJYf76J/XPYpb5DHYcWxELgCFo5MWRnYex2L92gm1xcx1CAPVN5JbpIxhkHuXIJx0JBhJAHUvYopByK0ZNFqMkgylVwvuY2gmo085cO6I5GL23NnaKjLKJo7LLPQpJZ1BscMIyrwQTm2CAvJMok6vh88WsB/TI7nsPmQ== ares@bart
cat sshcat ssh/files/default/authorized_keys 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCweR1smIcvgQypoP1nDYiM1k+i+uVIIr1iuYWAALsLFilBEikqLP7n/AOOFoXjj0xyaviAiYxLjVKVyx3ozwGIbRi4TirReoLdqaVU1BFeyCpPV0jZFb+2oCO5pRx7nizXo3FaYdfcJsSNjwpkkpnRGfO8gepPR0XpG3jcnyOHShXSG/5KvgeuoWYelXWhXH9UjhuIhO3lqu3kJV8K+J1zha9AEi+UIsDwDDrcmxwnqzV1Mz0t2C2A3PEyGQorq1K/mqFsa+Rd9O0Z6Bvi/PkfYNBfaF2VHlNdFvYS8gNLpF1Vd5jC6fkz6diNFZN4z458lEpeb/nxFnQoGEFciiK3Z2HmfeJCqtW5IelQ8+WjlJ77SVMNwF2zFfvqR4Hn9ieprN5VdO6rwCGsQ7fdwwX+Y3i1sfQsyqIecUe8CN0ka4AEmMOzrd8YG1N25KbmQYn7ySYN1JNJSjmJqaEJ0GHNQB+lH3Ps1J4TFBnCiEiHa2iNz/310v2jHROFsDd7EuXKBjLlWfyz4ONu+bYF25IM528DbnF7l1FlXfuxDxJ4KmnpK9OmL7dW1WWGtJzcDm5PXNLda47P43Rxyi4A//MP/A8TQsX2kTsPr+hUGZhUk61kOb0D3TPCXk/OZXFNx6oPoj4Wl2wgZ9qfTG78AH4EMQUgdNhMCvFWL6dy+i6dBQ== ares"
end

nfs_export "/" do
  network '192.168.122.1'
  writeable true
  sync false
  options ['no_root_squash']
end

if node.platform == 'debian'
  package 'debhelper'
  package 'devscripts'
end
