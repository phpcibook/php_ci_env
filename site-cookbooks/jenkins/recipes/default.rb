# Jenkins本体のインストール
apt_repository "jenkins" do
  uri "http://pkg.jenkins-ci.org/debian binary/"
  key "http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key"
  retries 10
  retry_delay 10
  action :add
end

# JenkinsがJDK8に依存するように変更になったので古いバージョンを除去
%w{openjdk-6-jre openjdk-6-jdk}.each do |package_name|
  package package_name do
    action :remove
  end
end

# add-apt-repositoryを利用できるようにする
package 'software-properties-common' do
  action :install
end

# open-jdk8のレポジトリを追加
bash 'add-apt-repository' do
  code <<-EOH
    sudo add-apt-repository ppa:openjdk-r/ppa
    sudo apt-get update
  EOH
end

# open-jdk8をインストール
package "openjdk-8-jdk" do
  action :install
end

package "jenkins" do
  action :install
end

service "jenkins" do
  action [:enable, :start]
end
