
resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: 'Plan-Win-B1'
  location: resourceGroup().location
  sku: {
    name: 'B1'
  }
  kind: 'app'
}

resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: 'az400c114trainnerwin'
  location: resourceGroup().location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlan.id
    reserved: true
    siteConfig: {
      windowsFxVersion: 'DOTNETCORE|8.0'
      appSettings: [
        {
          name: 'ASPNETCORE_ENVIRONMENT'
          value: 'Development'
        }
        {
          name : 'UseOnlyInMemoryDatabase'
          value : 'true'
        }
      ]
    }
  }
}
  