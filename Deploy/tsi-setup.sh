subscriptionId=$(az account show --query id -o tsv)

spName='Porject15-OpenPlatform-TSI-SP'-"$subscriptionId"

servicePrincipalAppId=$(az ad app list --show-mine --query "[?displayName=='$spName'].appId" -o tsv)

if [ -z "$servicePrincipalAppId" ]; then
    servicePrincipalAppId=$(az ad app create --display-name $spName --identifier-uris "https://$spName"  --oauth2-allow-implicit-flow true --required-resource-accesses '[{"resourceAppId":"120d688d-1518-4cf7-bd38-182f158850b6","resourceAccess":[{"id":"a3a77dfe-67a4-4373-b02a-dfe8485e2248","type":"Scope"}]}]' --query appId -o tsv)
fi

servicePrincipalObjectId=$(az ad sp list --show-mine --query "[?appDisplayName=='$spName'].objectId" -o tsv)

if [ -z "$servicePrincipalObjectId" ]; then
    servicePrincipalObjectId=$(az ad sp create --id $servicePrincipalAppId --query objectId -o tsv)
fi

servicePrincipalSecret=$(az ad app credential reset --append --id $servicePrincipalAppId --credential-description "TSISecret" --query password -o tsv)
servicePrincipalTenantId=$(az ad sp show --id $servicePrincipalAppId --query appOwnerTenantId -o tsv)

echo 'Service Principal App Id    :' $servicePrincipalAppId
echo 'Service Principal Password  :' $servicePrincipalSecret
echo 'Service Principal Tenant Id :' $servicePrincipalTenantId
echo 'Service Principal Object Id :' $servicePrincipalObjectId

rm ./tsi-setup.sh
