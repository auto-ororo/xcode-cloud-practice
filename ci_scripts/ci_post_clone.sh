#!/bin/sh

# 環境に応じたスクリプトを実行
# PROJECT_ENVはXcode Cloud上で環境変数として設定
if [ $PROJECT_ENV = 'Prd' ]
then
    ./prd_post_clone_task.sh
else
    ./dev_post_clone_task.sh
fi

cd ../Package
swift package resolve
