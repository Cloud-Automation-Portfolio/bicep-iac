param environment string = 'dev'
param storageAccountNames array = [
  'lab3devstorage01'
  'lab3devstorage02'
]

resource storageAccounts 'Microsoft.Storage/storageAccounts@2022-09-01' = [for name in storageAccountNames: if (environment != 'prod') {
  name: name
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
  }
  tags: {
    Environment: environment
    DeployedBy: 'Bicep'
  }
}]
