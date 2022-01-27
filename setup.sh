#!/bin/zsh

DIR="$(dirname "$(realpath "$0")")"
target_file=$DIR/package.json

echo -n "이름: "
read name

echo -n "설명: "
read description

echo -n "저장소: "
read repository

new_content=$(cat $target_file |
sed "s|__NAME__|$name|g" |
sed "s|__DESCRIPTION__|$description|g" |
sed "s|__REPOSITORY__|$repository|g" |
jq)

echo "미리보기:"
echo $new_content

echo "이대로 만들까요?"
read

echo $new_content > $target_file

echo "package.json 파일 설정 완료."
echo "이 스크립트를 삭제합니다."
read

rm $DIR/setup.sh
