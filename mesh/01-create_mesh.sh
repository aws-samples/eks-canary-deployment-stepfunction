aws appmesh create-mesh --mesh-name demomesh

# create virtual node/router for order service
aws appmesh create-virtual-node --cli-input-json file://v1/order/vn.json
aws appmesh create-virtual-router --cli-input-json file://v1/order/vr.json
aws appmesh create-route --cli-input-json file://v1/order/r.json

# create virtual node/router for product service
aws appmesh create-virtual-node --cli-input-json file://v1/product/vn.json
aws appmesh create-virtual-router --cli-input-json file://v1/product/vr.json
aws appmesh create-route --cli-input-json file://v1/product/r.json

# create virtual node/router for customer service
aws appmesh create-virtual-node --cli-input-json file://v1/customer/vn.json
aws appmesh create-virtual-router --cli-input-json file://v1/customer/vr.json
aws appmesh create-route --cli-input-json file://v1/customer/r.json

# create virtual services
aws appmesh create-virtual-service --mesh-name demomesh --cli-input-json file://v1/customer/vs.json
aws appmesh create-virtual-service --mesh-name demomesh --cli-input-json file://v1/product/vs.json
