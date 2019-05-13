# delete virtual services
aws appmesh delete-virtual-service --mesh-name demomesh --virtual-service-name product.default.svc.cluster.local
aws appmesh delete-virtual-service --mesh-name demomesh --virtual-service-name customer.default.svc.cluster.local

aws appmesh delete-route --mesh-name demomesh --route-name product-r --virtual-router-name product-vr
aws appmesh delete-route --mesh-name demomesh --route-name customer-r --virtual-router-name customer-vr
aws appmesh delete-route --mesh-name demomesh --route-name order-r --virtual-router-name order-vr

aws appmesh delete-virtual-router --mesh-name demomesh --virtual-router-name product-vr
aws appmesh delete-virtual-router --mesh-name demomesh --virtual-router-name customer-vr
aws appmesh delete-virtual-router --mesh-name demomesh --virtual-router-name order-vr

aws appmesh delete-virtual-node --mesh-name demomesh --virtual-node-name product-vn
aws appmesh delete-virtual-node --mesh-name demomesh --virtual-node-name customer-vn
aws appmesh delete-virtual-node --mesh-name demomesh --virtual-node-name order-vn
aws appmesh delete-virtual-node --mesh-name demomesh --virtual-node-name product-v15-vn
aws appmesh delete-virtual-node --mesh-name demomesh --virtual-node-name customer-v2-vn

# aws appmesh delete-virtual-node --mesh-name demomesh --virtual-node-name product-v2-vn
# aws appmesh delete-virtual-node --mesh-name demomesh --virtual-node-name customer-v15-vn

aws appmesh delete-mesh --mesh-name demomesh