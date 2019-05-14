#!/bin/bash

export PATH=$PATH:/opt/awscli

get_blue_ratio(){
    aws appmesh describe-route --mesh-name demomesh \
    --route-name product-r \
    --virtual-router-name product-vr \
    --query "route.spec.httpRoute.action.weightedTargets[?virtualNode=='product-vn'].weight" \
    --output text
}

update_route(){
    # update_route blue_ratio green_ratio
    echo "update route now"
    blue="$1"
    green="$2"
    sed -e "s/#BLUE#/$blue/g" -e "s/#GREEN#/$green/g" cli-input.json.template > /tmp/cli-input.json
    aws appmesh update-route --cli-input-json file:///tmp/cli-input.json
}

update(){
    blue_ratio=$(get_blue_ratio)
    green_ratio=$((100-blue_ratio))
    echo "current: $blue_ratio $green_ratio"
    if [ $(($blue_ratio-10)) -gt 0 ]; then
        echo "update to: $(($blue_ratio-10)) $((100-$blue_ratio+10))"
        update_route "$(($blue_ratio-10))" "$((100-$blue_ratio+10))"
    elif [ $blue_ratio -eq 0 ]; then
        echo "done"
    elif [ $(($blue_ratio-10)) -lt 0 ]; then
        echo "update to: 0 100"
        update_route 0 100
    else
        echo "update to: 0 100"
        update_route 0 100
    fi
}

result="$(update)"

cat << EOF
{"body": "$result", "headers": {"content-type": "text/plain"}, "statusCode": 200}
EOF