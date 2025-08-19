#!/bin/bash

save_password() {
  read -p "サービス名を入力してください：" service_name
  read -p "ユーザー名を入力してください：" user_name
  read -s -p "パスワードを入力してください：" password

  # 次の行がターミナル上で前の行にインライン表示されることを防ぐために改行する
  echo
  echo "${service_name}:${user_name}:${password}" >> storage.txt
  echo "パスワードの追加は成功しました。"
}