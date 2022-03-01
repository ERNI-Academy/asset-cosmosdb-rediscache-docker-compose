param (
[Parameter(Mandatory = $true)]
[string]$backendPath=$(thow "-backendPath is required."))

$deviceDockerFile=$backendPath+"\src\1.Api\1.1 Device\Gerresheimer.Respimetrix.Api.Device\Dockerfile"
$deviceDefinitionDockerFile=$backendPath+"\src\1.Api\1.1 Device\Gerresheimer.Respimetrix.Api.Device\Dockerfile"
$inhalationDataDockerFile=$backendPath+"\src\1.Api\1.4 Inhalation Data\Gerresheimer.Respimetrix.Api.InhalationData\Dockerfile"

$deviceName = "gerresheimer.respimetrix.api.device"
$deviceDefinitionName = "gerresheimer.respimetrix.api.devicedefinition"
$inhalationDataName = "gerresheimer.respimetrix.api.inhalationdata"

$deviceDockerImageName = $deviceName + ":dev"
$deviceDefinitionDockerImageName = $deviceDefinitionName + ":dev"
$inhalationDataDockerImageName = $inhalationDataName + ":dev"

$deviceContainerName = $deviceName
$deviceDefinitionContainerName = $deviceDefinitionName
$inhalationDataContainerName = $inhalationDataName

$dockerContainers = (docker ps --filter "name=$inhalationDataContainerName" --quiet)
docker rm --force $dockerContainers
$dockerContainers = (docker ps --filter "name=$deviceDefinitionContainerName" --quiet)
docker rm --force $dockerContainers
$dockerContainers = (docker ps --filter "name=$deviceContainerName" --quiet)
docker rm --force $dockerContainers

docker build -t $deviceDockerImageName -f $deviceDockerFile $backendPath
docker build -t $deviceDefinitionDockerImageName -f $deviceDefinitionDockerFile $backendPath
docker build -t $inhalationDataDockerImageName -f $inhalationDataDockerFile $backendPath

# Port ranges
# Device Domain from 5010 till 5019
# Organization Domain from 5020 till 5029
# User Management Domain from 5030 till 5039
# Inhalation Data Domain from 5040 till 5049

# docker run --rm --detach --name $deviceContainerName -p 5010:80 $deviceDockerImageName
# docker run --rm --detach --name $deviceDefinitionContainerName -p 5011:80 $deviceDefinitionDockerImageName
# docker run --rm --detach --name $inhalationDataContainerName -p 5040:80 $inhalationDataDockerImageName

docker-compose up