#  # avoir installé Azure Cli
#  # se logger avec azure cli dans cet environnement
# # ensuite taper dans le terminal "chmod +x create_resource_groupe.sh" pour rendre le script exécutable
# # exécuter le script avec ./ nomduscript.sh

# # charger les variables d'environnement
 set -o allexport #suprime toutes les variables importées avant celle la
 source .env #crée des variables d'environnement à partir du .env 
 set +o allexport

 #créer un groupe de ressources (si c'est pas déj) fait)
 az group create --name $RESOURCE_GROUPE 


#  az group create --name $RESOURCE_GROUP --location $LOCATION #Créer le groupe ressource (renseigné dans le .env)
 
#  az storage account create --resource-group $RESOURCE_GROUP --name $STORAGE_ACCOUNT --location $LOCATION # créer le Blob

# # créer un conteneur pour le blob : 
# az ad signed-in-user show --query id -o tsv | az role assignment create --role "Storage Blob Data Contributor" --assignee @- --scope "/subscriptions/$SUBSCRIPTION/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.Storage/storageAccounts/$STORAGE_GROUP" 
# az storage container create --account-name $STORAGE_ACCOUNT --name $STORAGE_CONTAINER --auth-mode login

# # commande pour uploader le fichier :
#  az storage blob upload --account-name $STORAGE_ACCOUNT --container-name $STORAGE_CONTAINER --name script_hello.py --file script_hello.py --account-key $STORAGE_KEY
#  # ensuite checker la présence le fichier depuis le blob


# # récupérer la clé batch : 
# BATCH_KEY=$(az storage account keys list --resource-group $BATCH_RG --account-name $BATCH_ACCOUNT --query '[0].value' --output tsv)

# echo "BATCH_KEY='$BATCH_KEY'" >> .env
# echo "BATCH_KEY: $BATCH_KEY"

# # connexion au compte batch 
#  az batch account login --name $BATCH_ACCOUNT --resource-group qsBatch --shared-key-auth

# # création de pool batch
#  az batch pool create --id $POOL_ID --image canonical:0001-com-ubuntu-server-focal:20_04-lts --node-agent-sku-id "batch.node.ubuntu 20.04" --target-dedicated-nodes 1 --vm-size STANDARD_D2S_V3
#  #az pipelines create --name $PIPELINE_NAME --description 'Pipeline for contoso project' --repository SampleRepoName --branch master --repository-type tfsgit