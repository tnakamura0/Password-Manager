#!/bin/bash

save_password() {
  read -p "サービス名を入力してください：" service_name
  read -p "ユーザー名を入力してください：" user_name
  read -s -p "パスワードを入力してください：" password

  # 次の行がターミナル上で前の行にインライン表示されることを防ぐために改行する
  echo
  echo "${service_name}:${user_name}:${password}" >> storage.txt

  # 暗号化処理
  # テキストエディタで開いて確認できるように--armorオプションを指定する
  # gpgコマンドがデフォルトで結果を標準出力するため、/dev/nullに捨てる
  # 出力ファイルが既に存在する場合に上書きするか聞かれるため、--yesオプションにより自動で上書きする
  gpg --armor --encrypt --recipient 206074491+tnakamura0@users.noreply.github.com --yes storage.txt > /dev/null

  rm storage.txt
  
  echo "パスワードの追加は成功しました。"
}