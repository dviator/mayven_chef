#
# Cookbook Name:: news_crawler
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
package 'git' 

user 'newscrawler' do
	home '/opt/newscrawler'
	shell '/bin/bash'
end

directory '/opt/newscrawler' do
	owner 'newscrawler'
	group 'newscrawler'
	mode '0755'
end

directory '/data' do
	owner 'newscrawler'
	group 'newscrawler'
	mode '0755'
end

git '/opt/newscrawler' do
	repository 'https://github.com/maevyn11/dsforthepeople'
	user 'newscrawler'
	group 'newscrawler'
end
	
#Should eventually replace this with clean packaging within python's package distribution framework
#Needed before python3-pip can install correctly
execute 'update ubuntu' do
	command 'sudo apt-get update'
end
#Dependencies for newspaper
package 'python3-pip'
package 'python-dev'
package 'libxml2-dev libxslt-dev'
package 'libjpeg-dev zlib1g-dev libpng12-dev'

execute 'install newspaper' do
	command 'sudo pip3 install newspaper3k'
end

execute 'install retrying' do 
	command 'sudo pip3 install retrying'
end

execute 'install requests' do
	command 'sudo pip3 install requests'
end

execute 'install mechanicalsoup' do 
	command 'sudo pip3 install mechanicalsoup'
end

execute 'install timeout-decorator' do 
	command 'sudo pip3 install timeout-decorator'
end