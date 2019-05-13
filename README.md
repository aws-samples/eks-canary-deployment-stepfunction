# aws-appmesh-eks-refarch

This repository demonstrates how to deploy microservices on top of AWS App Mesh and Amazon EKS cluster.



## Architecture Overview

![](images/service-mesh-01.png)



## Main Services

- **Order Service** - A public-facing service API that query product service and customer service and response to the client
- **Product Service** - Internal service for product info lookup.
- **Customer Service** - Internal service for customer info lookup.



![](images/service-mesh-00.png)



