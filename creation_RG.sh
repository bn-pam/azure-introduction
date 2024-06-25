 # avoir installé Azure Cli
 # se logger avec azure cli dans cet environnement
# ensuite taper dans le terminal "chmod +x create_resource_groupe.sh" pour rendre le script exécutable
# exécuter le script avec ./ nomduscript.sh


# charger les variables d'environnement
 set -o allexport #suprime toutes les variables importées avant celle la
 source .env #crée des variables d'environnement à partir du .env 
 set +o allexport

#  az group create --name $RESOURCE_GROUP --location $LOCATION #Créer le groupe ressource (renseigné dans le .env)
 
#  az storage account create --name $STORAGE_GROUP --resource-group $RESOURCE_GROUP --location $LOCATION # créer le Blob

# créer un conteneur pour le blob : 
#  az ad signed-in-user show --query id -o tsv | az role assignment create --role "Storage Blob Data Contributor" --assignee @- --scope "/subscriptions/$SUBSCRIPTION/resourceGroups/$RESOURCE_GROUP/providers/Microsoft.Storage/storageAccounts/$STORAGE_GROUP" 
# az storage container create --account-name $STORAGE_GROUP --name $STORAGE_CONTAINER --auth-mode login

# commande pour uploader le fichier :
 az storage blob upload --account-name $STORAGE_ACCOUNT --container-name $STORAGE_CONTAINER --name script_hello.py --file script_hello.py --account-key $STORAGE_KEY
 # ensuite checker la présence le fichier depuis le blob