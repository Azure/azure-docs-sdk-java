# converted for main repo
Param(
  [string]$TargetFolder
)

$results = Get-Content "$TargetFolder/docs-ref-autogen/toc.yml","legacy-docs-toc-merge/toc.yml" 
# separate operations otherwise pshell leaves the file open and the set-content fails
$results | Set-Content "$TargetFolder/docs-ref-autogen/toc.yml" 

Copy-Item -Path "$TargetFolder/legacy-docs-toc-merge/*" -Exclude @("toc.yml") -Destination "$TargetFolder/docs-ref-autogen"