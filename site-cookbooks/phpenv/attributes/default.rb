# Nginxのドキュメントルートのオーナー
default['nginx']['docroot']['owner'] = 'root'
# Nginxのドキュメントルートのグループ
default['nginx']['docroot']['group'] = 'root'
# Nginxのドキュメントルートのパス
default['nginx']['docroot']['path'] = "/usr/share/nginx/html"
# Nginxのドキュメントルートが存在しないときに作成するかどうか
default['nginx']['docroot']['force_create'] = false
# Nginxのdefaultサイト設定に引き渡すパラメータ
default['nginx']['default']['fastcgi_params'] = []
# Nginxでテスト用のVirtualHostを使うかどうか
default['nginx']['test']['available'] = false
# Nginxのtestサイト設定に引き渡すパラメータ
default['nginx']['test']['fastcgi_params'] = []
# MySQLのルートパスワード
default['mysql']['root_password'] = 'password'
