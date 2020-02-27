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

    with open(CODE2YAML, 'r') as f:
        text = f.read().rstrip("\n")
        repojson = json.loads(text)


    # location 

