# ☕️ Azure SDK for Java API documentation

## Microsoft Open Source Code of Conduct

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## How to Update the YAML content in the repo

1. Clone the [Azure sdk for Java](https://github.com/Azure/azure-sdk-for-java.git)
2. Create a code2yaml.json config file to specify your input folder, output folder, exclude paths. you can refer to the [template config file](./Scripts/code2yaml.json)
3. Run Code2Yaml.exe to generate YAML files.

Or you can run `powershell Scripts/build.ps1`, it would update the YAML files in api folder.
