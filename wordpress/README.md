![Release Charts](https://github.com/Majid-dev/wordpress-chart-argocd/actions/workflows/release.yml/badge.svg?branch=main)
![Lint Test](https://github.com/Majid-dev/wordpress-chart-argocd/actions/workflows/lint-test.yml/badge.svg)
![License](https://img.shields.io/github/license/Majid-dev/wordpress-chart-argocd)
![GitHub release (with filter)](https://img.shields.io/github/v/release/majid-dev/wordpress-chart-argocd)
# WordPress Helm Chart

This Helm chart allows you to deploy WordPress to your Kubernetes cluster using Helm and manage the deployment with ArgoCD.

## Table of Contents

- [Description](#description)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Description

This Helm chart simplifies the deployment of WordPress to your Kubernetes cluster. It packages the WordPress application, including the necessary configurations, and allows you to set up the required environment variables, such as the MySQL database host, username, password, and database name.

## Prerequisites

Before using this Helm chart, you should have the following:

- A running Kubernetes cluster
- Helm installed on your local machine
- ArgoCD installed and configured to manage deployments

## Installation

>### ArgoCD Installation:
To install WordPress Helm chart using ArgoCD, follow these steps:

1. Clone this GitHub repository to your local machine.

2. Customize the `values.yaml` file to set the required configuration values, such as the MySQL database username, password, and database name.

3. Package the Helm chart using the following command:

```bash
helm package .
```
4. Upload the packaged chart (wordpress-<`version`>.tgz) to a Helm repository accessible to your Kubernetes cluster.

5. Deploy the WordPress application using ArgoCD with application manifest described in `argocd/argocd-config.yaml` file as follow:
```bash
sudo kubectl apply -n argocd -f argocd/argocd-config.yaml
```

>### Helm Installation:

add helm chart repository:
```bash
helm repo add wordpress-chart https://Majid-dev.github.io/wordpress-chart-argocd
```
To install the wordpress-chart chart:
```bash
helm install my-wordpress wordpress-chart/wordpress
```
or use the package you have made in previous section as following:
```bash
helm install my-wordpress wordpress-<version>.tgz
```
To uninstall the chart:
```bash
helm delete my-wordpress
```

## Configuration
You can customize the WordPress deployment by modifying the values in the `values.yaml` file. The following are some of the configurable parameters:

| Parameter | Description | Default |
| --- | --- | ---|
| mysqlRootPassword | MySQL root password | rootpassword |
| mysqlDatabase | MySQL database name | wordpress |
| mysqlUser | MySQL username | wordpress |
| mysqlPassword | MySQL password | wordpresspassword |

## Usage
Once the WordPress application is deployed, access it using the NodePort or LoadBalancer IP associated with the WordPress service. You can forward localhost port to wordpress service to access wordpress via your machine:

```bash
kubectl port-forward service/wordpress 8080:80
```

After deploying, you can log in to the WordPress admin dashboard using the provided credentials.

## Contributing
Contributions to this Helm chart are welcome! If you find any issues or have improvements to suggest, please open an issue or submit a pull request on the GitHub repository.

## License
This project is licensed under the MIT License.

