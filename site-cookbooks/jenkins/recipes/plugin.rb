# プラグインのインストール
remote_file "/var/lib/jenkins/jenkins-cli.jar" do
  source "http://localhost:8080/jnlpJars/jenkins-cli.jar"
  retries 30
  retry_delay 10
end

execute 'get-update-json'  do
  command "curl -L http://updates.jenkins-ci.org/update-center.json | sed '1d;$d' | curl -X POST -H 'Accept: application/json' -d @- http://localhost:8080/updateCenter/byId/default/postBack"
  action :run
end

%w{git checkstyle cloverphp dry htmlpublisher jdepend plot pmd violations xunit phing}.each do |plugin_name|
  e = execute "sudo /usr/bin/java -jar /var/lib/jenkins/jenkins-cli.jar -s http://localhost:8080 install-plugin ".concat(plugin_name) do
    action :run
  end
end

service "jenkins" do
  action :restart
end
