import os
import yaml
import shutil

TEMP_YAML_FOLDER = "temporary-src-based-yml"
TARGET_SOURCE_FOLDER = "docs-ref-autogen"

root_dir = os.path.abspath(os.path.join(os.path.abspath(__file__), ".."))

if __name__ == "__main__":
    # Copy all yaml files to target
    src_folder = os.path.join(root_dir, TEMP_YAML_FOLDER, "raw-yaml")
    for f in src_folder:
        try:
            shutil.copy(f, os.path.join(root_dir, TARGET_SOURCE_FOLDER))
        except:
            continue

    # Append temp toc to target toc
    with open(os.path.join(root_dir, TEMP_YAML_FOLDER, 'toc.yml'), "r") as legacy_toc:
        temp_toc = yaml.safe_load(legacy_toc)
    appended_content = yaml.dump(temp_toc, default_flow_style=False)
    with open(os.path.join(root_dir, TARGET_SOURCE_FOLDER, "toc.yml"), "a", encoding="utf-8") as stable_toc:
        stable_toc.write(appended_content)
