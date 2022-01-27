#!/bin/zsh

DIR="$(dirname "$(realpath "$0")")"

################################################################
# Getting ready
################################################################

package_file=$DIR/package.json
readme_file=$DIR/README.md

echo -n "이름: "
read name

echo -n "설명: "
read description

echo -n "저장소: "
read repository

################################################################
# package.json
################################################################

new_package_file_content=$(cat $package_file |
sed "s|__NAME__|$name|g" |
sed "s|__DESCRIPTION__|$description|g" |
sed "s|__REPOSITORY__|$repository|g")

echo "package.json 미리보기:"
echo $new_package_file_content

echo "이대로 만들까요?"
read

echo $new_package_file_content > $package_file

echo "package.json 설정 완료."
echo ""

################################################################
# README.md
################################################################

readme_file_content="# $name\n\n$description"

echo "README.md 미리보기:"
echo $readme_file_content

echo "이대로 만들까요?"
read

echo $readme_file_content > $readme_file

echo "README.md 설정 완료."
echo ""

################################################################
# Finishing
################################################################

echo "이 스크립트를 삭제합니다."
read

rm $DIR/setup.sh
