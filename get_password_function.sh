#!/bin/bash

get_password() {
  read -p "サービス名を入力してください：" service_name

  # 復号化
  # 標準エラー出力を/dev/nullに捨てる
  gpg --yes storage.txt.asc > storage.txt 2> /dev/null

  # storage.txtにはservice_name:user_name:passwordの形式でデータが保存されている
  # そのため、正規表現^を用いて『特定のservice_name:』から始まる行を抽出できる
  data=$(cat storage.txt | grep "^${service_name}:")

  if [ -z ${data} ]; then
    echo "そのサービスは登録されていません。"
  else
    # user_name:password
    username_password_data=${data#${service_name}:}
    # user_name
    user_name_data=${username_password_data%:*}
    # password
    password_data=${username_password_data#*:}
    echo "サービス名：${service_name}"
    echo "ユーザー名：${user_name_data}"
    echo "パスワード：${password_data}"
  fi

  # 暗号化
  # save_password_function.shと同様
  gpg --armor --encrypt --recipient 206074491+tnakamura0@users.noreply.github.com --yes storage.txt > /dev/null

  rm storage.txt
}