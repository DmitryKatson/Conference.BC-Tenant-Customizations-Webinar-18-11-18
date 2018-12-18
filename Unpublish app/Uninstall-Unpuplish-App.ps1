
# All functions here https://github.com/Microsoft/navcontainerhelper

$ContainerName = 'BC-Current-CA'
$AppName = 'Fresh Food'

UnPublish-NavContainerApp -containerName $ContainerName -appName $AppName -unInstall -doNotSaveData

Sync-NavContainerApp -containerName $ContainerName -appName $AppName -Mode Clean