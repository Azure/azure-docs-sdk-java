# converted for main repo
Param(
  [string]$TargetFolder
)

$results = Get-Content "$TargetFolder/docs-ref-autogen/toc.yml","legacy-docs-toc-merge/toc.yml" 
# needs to be another 
$results | Set-Content "$TargetFolder/docs-ref-autogen/toc.yml" 
Copy-Item -Path "$TargetFolder/legacy-docs-toc-merge/*" -Destination "$TargetFolder/docs-ref-autogen"