# requires pygithub

import json
import os
import glob
import yaml
import pdb
from github import Github

CODE2YAML = "./code2yaml.json"
REPOJSON = "./repo.json"


REPO_BRANCH_TEMPLATE = "https://{target_repo}/tree/{branch}/{relative_loc}"

if __name__ == "__main__":
    
    # parse 
    with open(CODE2YAML, 'r') as f:
        text = f.read().rstrip("\n")
        code2yaml = json.loads(text)

    with open(REPOJSON, 'r') as f:
        text = f.read().rstrip("\n")
        repojson = json.loads(text)

    # sample code2yaml
    # {
    # "input_paths": [
    #     "src/azure-ad-adal/adal/src/main/java/com/microsoft/aad/adal",
    #     "src/azure-ad-msal/msal/src/main/java/com/microsoft/identity/client",
    #     ],
    # "exclude_paths": [
    #     "src/azure-appinsights/core/src/main/java/com/microsoft/applicationinsights/internal",
    #     "src/azure-appinsights/core/src/main/java/com/microsoft/applicationinsights/extensibility/initializer/docker/internal",
    #     ]
    # }

    # sample repo.json
    # {
    #     "repo": [
    #     {
    #         "url": "https://github.com/Azure/azure-libraries-for-java",
    #         "branch": "master",
    #         "name": "azure-libraries-for-java"
    #     },
    #     {
    #         "url": "https://github.com/AzureAD/azure-activedirectory-library-for-android",
    #         "branch": "master",
    #         "name": "azure-ad-adal"
    #     },
    #     {
    #         "url": "https://github.com/AzureAD/microsoft-authentication-library-for-android",
    #         "branch": "master",
    #         "name": "azure-ad-msal"
    #     }
    #     ]
    # }

    resolved_paths = []
    replaced_paths = []

    for input_path in code2yaml['input_paths']:
        for repo in repojson['repo']:
            if input_path.startswith("src/{}".format(repo['name'])):
                resolved_path = "{}/tree/{}{}".format(repo['url'], repo['branch'] or repo['tag'], input_path.replace("src/{}".format(repo['name']), ""))
                
                if 'com/' in input_path:
                    resolved_namespace = 'com.' + input_path.split('com/')[1].replace('/','.')
                else:
                    resolved_namespace = 'check root'

                resolved_paths.append(resolved_path+","+resolved_namespace)
                replaced_paths.append(input_path)


    inputs = set(code2yaml['input_paths'])
    seen_inputs = set(replaced_paths)

    unseen_inputs = inputs - seen_inputs

    with open('./resolved_paths.txt', 'w') as f:
        f.write("\n".join(resolved_paths))

    with open('./unresolved_paths.txt', 'w') as f:
        f.write("\n".join(list(unseen_inputs)))



    # the folder within the target repository is:
        # input_path.replace( src/{repo.name} )

    # get all the repo.json OUTPUTS.
    # figure out which src paths START with THOSE OUTPUTS

    # traverse up directories to find pom.xml
    # find packageinfo.java alongside file

