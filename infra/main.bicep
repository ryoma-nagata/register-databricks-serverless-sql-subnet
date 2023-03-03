targetScope = 'resourceGroup'

// general 
@description('対象のストレージアカウント名を入力')
param storageAccountName string
param allowSubnetIds array 

resource existiongstorage 'Microsoft.Storage/storageAccounts@2022-09-01' existing = {
  name: storageAccountName
}

module addStorageACLs 'modules/auxiliary/addStorageSubnetACLs.bicep'= {
  name: 'addStorageACLs'
  params: {
    location: existiongstorage.location
    storageAccountName: storageAccountName
    sku: existiongstorage.sku.name
    kind: existiongstorage.kind
    allowSubnetIds: allowSubnetIds
    networkAcls: existiongstorage.properties.networkAcls
  }
}

