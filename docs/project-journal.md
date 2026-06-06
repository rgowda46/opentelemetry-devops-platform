# 🚀 OpenTelemetry DevOps Platform - Project Journal

## 📋 Project Overview

The OpenTelemetry Demo is a cloud-native microservices application used to demonstrate observability concepts such as distributed tracing, metrics, and logging.

This project focuses on deploying, containerizing, automating, and operating the application using modern DevOps practices and cloud-native technologies.

The implementation covers Docker, Terraform, Amazon EKS, Kubernetes, AWS Load Balancer Controller, Ingress, and custom domain integration.

---

# Phase 1 - AWS Environment Setup

## Objective

Prepare a cloud environment for deploying and managing OpenTelemetry workloads.

### Activities

- Created a dedicated IAM user following least-privilege principles
- Configured AWS CLI authentication
- Provisioned an EC2 instance in AWS Mumbai Region
- Configured networking and security groups
- Established SSH access to the server

### Environment

| Resource | Value |
|----------|--------|
| Cloud Provider | AWS |
| Region | ap-south-1 |
| Instance Type | t2.large |

---

# Phase 2 - DevOps Toolchain Setup

## Objective

Install tools required for containerization, infrastructure provisioning, and Kubernetes management.

### Installed Tools

- Docker
- Terraform
- kubectl
- Helm
- eksctl
- AWS CLI

### Purpose

| Tool | Usage |
|--------|--------|
| Docker | Container Runtime |
| Terraform | Infrastructure as Code |
| kubectl | Kubernetes Management |
| Helm | Kubernetes Package Manager |
| eksctl | EKS Management |
| AWS CLI | AWS Resource Management |

---

# Phase 3 - Local Application Deployment

## Objective

Deploy OpenTelemetry Demo locally using Docker Compose.

### Activities

- Cloned OpenTelemetry Demo repository
- Reviewed project structure
- Deployed microservices using Docker Compose

### Command

```bash
docker compose up
```

### Components Deployed

- Frontend
- Product Catalog
- Recommendation Service
- Ad Service
- Cart Service
- Checkout Service
- OpenTelemetry Collector
- Prometheus
- Grafana
- Jaeger
- PostgreSQL
- Kafka
- OpenSearch

### Outcome

Successfully deployed all OpenTelemetry microservices and observability components.

---

# Phase 4 - Containerization

## Objective

Create custom Docker images for selected OpenTelemetry services.

### Services Containerized

| Service | Language |
|----------|----------|
| Recommendation Service | Python |
| Ad Service | Java |
| Product Catalog Service | Go |

### Containerization Concepts Applied

#### Recommendation Service

- Python containerization
- Dependency management
- Runtime optimization

#### Ad Service

- Multi-stage Docker builds
- Gradle build process
- Runtime image reduction

#### Product Catalog Service

- Go binary compilation
- Multi-stage builds
- Lightweight runtime images

### Outcome

Successfully built and tested custom container images.

---

# Phase 5 - Docker Hub Integration

## Objective

Publish custom container images to a public container registry.

### Published Images

```text
rohith4693/recommendationservice:v1
rohith4693/adservice:v1
rohith4693/productcatalog:v1
```

### Validation

```bash
docker images

docker push
```

### Outcome

Successfully published custom images to Docker Hub.

---

# Phase 6 - Infrastructure as Code

## Objective

Provision AWS infrastructure using Terraform.

### Resources Provisioned

- VPC
- Public Subnets
- Internet Gateway
- Route Tables
- Amazon EKS Cluster
- Managed Node Groups

### Terraform Workflow

```bash
terraform init

terraform plan

terraform apply
```

### Validation

```bash
aws eks list-clusters

kubectl get nodes
```

### Outcome

Successfully provisioned production-style Kubernetes infrastructure on AWS.

---

# Phase 7 - Kubernetes Migration

## Objective

Migrate OpenTelemetry Demo from Docker Compose to Kubernetes.

### Resources Created

- Deployments
- Services
- ConfigMaps
- Secrets
- Service Accounts

### Validation

```bash
kubectl get pods

kubectl get pods -o wide
```

### Outcome

Successfully deployed OpenTelemetry workloads to Amazon EKS.

---

# Phase 8 - AWS Load Balancer Controller

## Objective

Enable Kubernetes Ingress integration with AWS Application Load Balancer.

### Activities

- Associated EKS OIDC Provider
- Configured IAM Roles for Service Accounts (IRSA)
- Created IAM policies and roles
- Installed AWS Load Balancer Controller using Helm

### Validation

```bash
kubectl get pods -n kube-system

kubectl get deployment -n kube-system aws-load-balancer-controller
```

### Outcome

Successfully integrated Kubernetes with AWS Application Load Balancers.

---

# Phase 9 - Ingress Configuration

## Objective

Expose OpenTelemetry Frontend externally through Kubernetes Ingress.

### Configuration

- AWS Application Load Balancer
- Internet-facing scheme
- IP target type
- Kubernetes Ingress resource

### Validation

```bash
kubectl get ingress

kubectl describe ingress frontend-proxy
```

### Outcome

AWS Load Balancer Controller automatically provisioned an Application Load Balancer.

---

# Phase 10 - Custom Domain Integration

## Objective

Provide user-friendly access to the application through a custom domain.

### Domain

```text
rohith-otel.duckdns.org
```

### Traffic Flow

```text
Custom Domain
        ↓
AWS Application Load Balancer
        ↓
Kubernetes Ingress
        ↓
Frontend Service
        ↓
Frontend Pod
        ↓
OpenTelemetry Application
```

### Validation

```bash
curl -I http://rohith-otel.duckdns.org
```

Result:

```text
HTTP/1.1 200 OK
x-powered-by: Next.js
server: envoy
```

### Outcome

Successfully validated end-to-end traffic routing from custom domain to Kubernetes workloads.

---

# Challenges and Resolutions

## Storage Constraints

### Issue

OpenTelemetry components consumed available EC2 storage.

### Resolution

Expanded EBS volume and resized filesystem.

---

## Resource Constraints

### Issue

High memory and CPU consumption during local deployment.

### Resolution

Scaled EC2 resources appropriately and optimized deployment workflow.

---

## EKS Cluster Recreation

### Issue

Destroying and recreating EKS clusters changed the OIDC provider.

### Resolution

Recreated IAM roles and service accounts using the new OIDC provider.

---

## Ingress Routing

### Issue

ALB returned 404 responses due to host-based routing configuration.

### Resolution

Validated routing through correct host headers and updated ingress configuration.

---

## DNS Configuration

### Issue

Public DNS access encountered filtering and propagation challenges.

### Resolution

Configured alternative public domain access and validated routing successfully.

---

# Key Learnings

### AWS

- IAM Best Practices
- VPC Networking
- EKS Cluster Management
- Application Load Balancers

### Terraform

- Infrastructure as Code
- Terraform Modules
- Resource Lifecycle Management
- Infrastructure Automation

### Kubernetes

- Pods
- Deployments
- Services
- ConfigMaps
- Secrets
- Service Accounts
- Ingress

### Cloud-Native Networking

- AWS Load Balancer Controller
- OIDC Authentication
- IAM Roles for Service Accounts (IRSA)
- Host-Based Routing
- DNS Management

### Observability

- OpenTelemetry
- Prometheus
- Grafana
- Jaeger

---

# Technologies Used

| Category | Technology |
|----------|------------|
| Cloud | AWS |
| Containerization | Docker |
| Registry | Docker Hub |
| IaC | Terraform |
| Kubernetes | Amazon EKS |
| Package Management | Helm |
| Networking | AWS ALB |
| Ingress | Kubernetes Ingress |
| Observability | OpenTelemetry |
| Monitoring | Prometheus |
| Visualization | Grafana |
| Tracing | Jaeger |
| Messaging | Kafka |
| Database | PostgreSQL |

---

# Project Outcomes

✅ Containerized OpenTelemetry Services

✅ Published Images to Docker Hub

✅ Provisioned Infrastructure Using Terraform

✅ Deployed Application on Amazon EKS

✅ Configured AWS Load Balancer Controller

✅ Implemented Kubernetes Ingress

✅ Configured Public Domain Access

✅ Validated End-to-End Traffic Flow

✅ Demonstrated Production-Style Kubernetes Deployment

✅ Applied Modern DevOps Practices Across the Entire Stack