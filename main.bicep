@description('Location for all resources (defaults to current RG location)')
param location string = resourceGroup().location

@description('Azure AD objectId for Key Vault admin access')
param objectId string

module keyVault 'modules/keyVault.bicep' = {
  name: 'kvDeploy'
  params: {
    kvName: 'securelab3kv${uniqueString(resourceGroup().id)}'
    location: location
    tenantId: subscription().tenantId   // <-- Bicep-native, auto-injects correct tenant!
    objectId: objectId
  }
}
