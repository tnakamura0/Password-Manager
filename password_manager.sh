#!/bin/bash
source save_password_function.sh
source get_password_function.sh
source exit_program_function.sh

read -p "次の選択肢から入力してください(Add Password/Get Password/Exit)：" select

case ${select} in
  "Add Password")save_password;;
  "Get Password")get_password;;
  "Exit")exit_program;;
  *);;
esac