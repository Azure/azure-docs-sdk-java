# Folder structure:
#
# |-azure-docs-sdk-java
#    |
#    |--code2yaml.json
#    |--Scripts
#       |
#       |--build.ps1
#       |--code2yaml.zip
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
          & git clone -q --branch=master $gitRepo $folderName
      }
}

$ErrorActionPreference = 'Stop'

$scriptPath = $MyInvocation.MyCommand.Path
$scriptHome = Split-Path $scriptPath
$scriptParent = Split-Path $scriptHome
$apiref = "docs-ref-autogen"
$code2yamlZip = "code2yaml.zip"
$code2yamlArtifact = "https://ci.appveyor.com/api/projects/ansyral/code2yaml/artifacts/code2yaml.zip?branch=azuredocs"
$code2yaml = "code2yaml"
$src = "src"
Push-Location $scriptParent

# unzip code2yaml.zip to src folder
Add-Type -AssemblyName System.IO.Compression.FileSystem
if (Test-Path $code2yaml){
    Remove-Item $code2yaml\* -recurse -Force
}
Invoke-WebRequest $code2yamlArtifact -OutFile $scriptHome\$code2yamlZip
Unzip $scriptHome\$code2yamlZip $scriptParent\$code2yaml

# update config
$config = Get-Content $scriptParent\code2yaml.json -Raw | ConvertFrom-Json
if (!$config.PSObject.Properties['output_path'])
{
  $config | add-member -Name "output_path" -value "_javadocs" -MemberType NoteProperty
}
else
{
  $config.output_path = "_javadocs"
}
$config | ConvertTo-Json | Out-File $scriptParent\code2yaml_updated.json -Force

# run code2yaml to generate metadata yaml files
& $code2yaml\code2yaml code2yaml_updated.json
Remove-Item code2yaml_updated.json

if ($lastexitcode -ne 0)
{
    exit $lastexitcode
}
# update to api folder
Remove-Item $scriptParent\$apiref -recurse
Copy-Item -Path "_javadocs\*" -Destination $scriptParent\$apiref -Force

Pop-Location
