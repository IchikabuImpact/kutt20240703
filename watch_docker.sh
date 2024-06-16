#!/bin/bash

# 監視するコンテナ名
containers=("st-kutt-1" "st-redis-1" "st-postgres-1")

# 各コンテナの状態を確認
for container in "${containers[@]}"
do
    status=$(docker inspect --format="{{.State.Running}}" $container 2>/dev/null)

    if [ "$status" != "true" ]; then
        echo "Restarting $container..."
        docker start $container
    else
        echo "$container is running."
    fi
done

