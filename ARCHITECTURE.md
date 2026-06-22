# Architecture 3-Tiers INPT IaC

## Diagramme

Internet
    |
[IGW: inpt-3tiers-dev-igw]
    |
[VPC: 10.3.0.0/16]
    |
+---+-------------------+
|   Public Subnets      |
|   10.3.0.0/20  (1a)   |  <- web-sg -> 1 instance web
|   10.3.16.0/20 (1b)   |
+---+-------------------+
    |
+---+-------------------+
|   Private Subnets     |
|   10.3.64.0/20 (1a)   |  <- app-sg -> 2 instances app
|   10.3.80.0/20 (1b)   |
+---+-------------------+

S3:
  - inpt-3tiers-dev-assets  (assets statiques)
  - inpt-3tiers-dev-backups (sauvegardes)

## Modules
- network : VPC, subnets, IGW
- compute : security groups, instances EC2
- storage : buckets S3

## Choix techniques
- CIDR 10.3.0.0/16 isole de tp05 (10.0/10.1) et tp07 (10.0/10.1)
- count pour les instances (scalable facilement)
- Tags Role=web/app pour identifier les couches
- Separation modules pour reutilisabilite