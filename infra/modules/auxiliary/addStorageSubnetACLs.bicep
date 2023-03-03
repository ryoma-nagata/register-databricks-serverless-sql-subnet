param storageAccountName string
param location string 
param sku string
param kind string 
param allowSubnetIds array
param networkAcls object
// param bypass string
// param defaultAction string 
// param resourceAccessRules array
// param virtualNetworkRules array
// param ipRules array

var verifiedResourceAccessRules = contains(networkAcls,'resourceAccessRules') ?  networkAcls.resourceAccessRules:[] 
var allowSubnetIdsRules = [for allowSubnetId in allowSubnetIds:{
  id:allowSubnetId
  action:'Allow'
} ]

var allowSubnetIdsRulesUnion  = union(allowSubnetIdsRules , networkAcls.virtualNetworkRules)

resource storage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: sku
  }
  kind: kind
  properties:{
    networkAcls:{
      defaultAction: networkAcls.defaultAction
      virtualNetworkRules: allowSubnetIdsRulesUnion
      bypass: networkAcls.bypass
      ipRules: networkAcls.ipRules
      resourceAccessRules: verifiedResourceAccessRules
    }
  }
}
