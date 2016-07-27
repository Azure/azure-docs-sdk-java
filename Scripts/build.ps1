# Folder structure:
#
# |-azure-docs-sdk-java
#    |
#    |--Scripts
#       |
#       |--build.ps1
#       |--code2yaml.zip
#       |--code2yaml.json
function Unzip 
{ 
     param([string]$zipfile, [string]$outpath) 
 
 
     [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}
function CloneOrPull
{
      param([string]$gitRepo, [string]$folderName)

      if (Test-Path $folderName\.git)
      {
          Push-Location $folderName
          & git pull
          Pop-Location
      }
      else
      {
          & git clone $gitRepo $folderName
      }
}

$ErrorActionPreference = 'Stop'

$scriptPath = $MyInvocation.MyCommand.Path
$scriptHome = Split-Path $scriptPath
$scriptParent = Split-Path $scriptHome
$api = "api"
$code2yamlZip = "code2yaml.zip"
$code2yaml = "code2yaml"
$obj = "obj"
md -Force $scriptHome\$obj
Push-Location $scriptHome\$obj

# unzip code2yaml.zip to obj folder
Add-Type -AssemblyName System.IO.Compression.FileSystem
if (Test-Path $code2yaml){
    Remove-Item $code2yaml\* -recurse -Force
}
Unzip $scriptHome\$code2yamlZip $scriptHome\$obj\$code2yaml

# clone or pull latest sdk code

CloneOrPull "https://github.com/Azure/azure-sdk-for-java.git" "azure-sdk-for-java"
if ($lastexitcode -ne 0)
{
    exit $lastexitcode
}

# update config
$config = Get-Content $scriptHome\code2yaml.json -Raw | ConvertFrom-Json
$config.output_path = "_javadocs"
$config | ConvertTo-Json | Out-File "code2yaml.json" -Force

# run code2yaml to generate metadata yaml files
& $code2yaml\Microsoft.Content.Build.Code2Yaml code2yaml.json

if ($lastexitcode -ne 0)
{
    exit $lastexitcode
}
# update to api folder
Remove-Item $scriptParent\$api -recurse
Copy-Item -Path "_javadocs\*" -Destination $scriptParent\$api -Force

Pop-Location
