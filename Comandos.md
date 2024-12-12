Crear un Service Principal para autenticar Devops en Azure
> az ad sp create-for-rbac --name [Nombre-Service-Principal]--role contributor --scopes /subscriptions/[Id-Subscripcion]

Crear un Service Principal para autentifar Github en Azure (con SDK auth)
> az ad sp create-for-rbac --name [Nombre-Service-Principal]- --role contributor --scopes /subscriptions/[Id-Subscripcion]/resourceGroups/[Nombre-Resource-Group] --sdk-auth
