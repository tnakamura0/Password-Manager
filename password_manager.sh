#!/bin/bash

echo "パスワードマネージャーへようこそ！"
read -p "サービス名を入力してください：" service_name
read -p "ユーザー名を入力してください：" user_name
read -s -p "パスワードを入力してください：" password
# 次の行の"Thank you!"が前の行にインライン表示されるので改行する
echo
echo "${service_name}:${user_name}:${password}" >> storage.txt
echo "Thank you!"