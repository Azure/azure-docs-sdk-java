# How to Update the YAML content in the repo

1. Clone the [Azure sdk for Java](https://github.com/Azure/azure-sdk-for-java.git)
2. Create a code2yaml.json config file to specify your input folder, output folder, exclude paths. you can refer to the [template config file](./Scripts/code2yaml.json)
3. Run Code2Yaml.exe to generate YAML files.

Or you can run `powershell Scripts/build.ps1`, it would update the YAML files in api folder.
