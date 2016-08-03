$ErrorActionPreference = 'Stop'
 

$scriptPath = $MyInvocation.MyCommand.Path
$scriptHome = Split-Path $scriptPath
$azurejavadocs = "docs"

Push-Location $scriptHome

# get and update code2yaml.json
$user = [Environment]::UserName
echo $user
& git clone "git@github.com:Azure/azure-docs-sdk-java.git" $azurejavadocs
if ($lastexitcode -ne 0)
{
    exit $lastexitcode
}

# call Scripts/build.ps1 to generate metadata yaml files
& $azurejavadocs\Scripts\build.ps1

if ($lastexitcode -ne 0)
{
    exit $lastexitcode
}
# update to remote repo
Push-Location $azurejavadocs
& git add .
& git commit -m "CI Updates"
& git push -u origin master
Pop-Location

Pop-Location
