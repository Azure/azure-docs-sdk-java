function CloneOrPull
{
      param([string]$gitRepo, [string]$branchOrTag, [string]$folderName)

      if (Test-Path $folderName\.git)
      {
          Push-Location $folderName
          & git pull
          Pop-Location
      }
      else
      {
          & git clone -q --branch=$branchOrTag $gitRepo $folderName
      }
}

function Unzip 
{ 
     param([string]$zipfile, [string]$outpath) 
 
 
     [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

$ErrorActionPreference = 'Stop'

$scriptPath = $MyInvocation.MyCommand.Path
$rootFolder = Split-Path $scriptPath | Split-Path
$src = "src"
md -Force $rootFolder\$src
Push-Location $rootFolder\$src

$config = Get-Content $rootFolder\repo.json -Raw | ConvertFrom-Json
Foreach($repo in $config.repo){
    if ($repo.tag)
	{
	    CloneOrPull $($repo.url) $($repo.tag) $($repo.name)
	}
	else{
	    CloneOrPull $($repo.url) $($repo.branch) $($repo.name)
	}
	if ($repo.build_script)
	{
		Push-Location $($repo.name)
		Invoke-Expression $repo.build_script
		Pop-Location
	}
}
Pop-Location

Push-Location $rootFolder

# Generate Mapping file
$code2yamlConfigGeneratorZip = "code2yamlConfigGenerator.zip"
$code2yamlConfigGeneratorArtifact = "https://ci.appveyor.com/api/projects/ansyral/code2yamlConfigGenerator/artifacts/code2yamlConfigGenerator.zip?branch=master"
$code2yamlConfigGenerator = "code2yamlConfigGenerator"
# unzip code2yamlConfigGenerator.zip to src folder
Add-Type -AssemblyName System.IO.Compression.FileSystem

Invoke-WebRequest $code2yamlConfigGeneratorArtifact -OutFile $rootFolder\$code2yamlConfigGeneratorZip
Unzip $rootFolder\$code2yamlConfigGeneratorZip $rootFolder\$code2yamlConfigGenerator
& $rootFolder\$code2yamlConfigGenerator\Code2YamlConfigGenerator $rootFolder $rootFolder\docs-ref-mapping\reference.yml $rootFolder\$src
if (Test-Path $code2yamlConfigGenerator){
    Remove-Item $code2yamlConfigGenerator\* -recurse -Force
	Remove-Item $code2yamlConfigGeneratorZip -Force
}

Pop-Location
