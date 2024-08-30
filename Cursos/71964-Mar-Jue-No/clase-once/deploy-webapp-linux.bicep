
resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: 'Plan-B1'
  location: resourceGroup().location
  properties: {
    reserved: true
  }
  sku: {
    name: 'B1'
    tier: 'Basic'
  }
}

resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: 'az400c114trainner2'
  kind: 'app'
  location: resourceGroup().location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'DOTNETCORE|8.0'
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
  