# Comandos del Azure CLI que usamos en el Curso

Crear un Service Principal para autenticar Devops en Azure
> az ad sp create-for-rbac --name [Nombre-Service-Principal]--role contributor --scopes /subscriptions/[Id-Subscripcion]

Crear un Service Principal para autentifar Github en Azure (con SDK auth)
> az ad sp create-for-rbac --name [Nombre-Service-Principal]- --role contributor --scopes /subscriptions/[Id-Subscripcion]/resourceGroups/[Nombre-Resource-Group] --sdk-auth

Crear un Resource Group
> az group create --name [Nombre] --location [Location]

Crear un plan de un AppServie
> az appservice plan create --name [Nombre] --resource-group [Resource_Group] --sku [SKU]

Crear un AppService
> az webapp create --name app4trainner-Test --resource-group Rg-Az400-Clase-Ocho --plan Plan-S1

