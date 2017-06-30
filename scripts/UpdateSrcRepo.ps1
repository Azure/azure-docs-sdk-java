function CloneOrPull
{
      param([string]$gitRepo, [string]$branchOrTag, [string]$folderName)

      if (Test-Path $folderName\.git)
      {
          Push-Location $folderName
          & git pull origin $branchOrTag
          Pop-Location
      }
      else
      {
          $ErrorActionPreference = 'SilentlyContinue'
          $out = & git clone -q --branch=$branchOrTag $gitRepo $folderName
	  if ($LastExitCode -ne 0)
          {
              echo $out
          }
	  $ErrorActionPreference = 'Stop'
      }
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
