import argparse
import os
import json
import fnmatch
import re
import yaml
import glob
import shutil


LEGACY_SOURCE_FOLDER = "legacy/docs-ref-autogen"
TARGET_SOURCE_FOLDER = "docs-ref-autogen"

root_dir = os.path.abspath(os.path.join(os.path.abspath(__file__), ".."))

def check_against_targeted_namespaces(test_line, namespace_patterns_list):
  return any([re.match(namespace_pattern, test_line) for namespace_pattern in namespace_patterns_list])


if __name__ == "__main__":
  # parse packages.json
  with open(os.path.join(root_dir, "temporary-src-based-yml", 'migration.json'), 'r') as f:
    text = f.read().rstrip("\n")
    json = json.loads(text)

    migrating_namespaces = json["migrating_namespaces"]
    migrating_namespaces_regexs = [fnmatch.translate(namespace) for namespace in migrating_namespaces]

  # get the yml from legacy
  with open(os.path.join(root_dir, LEGACY_SOURCE_FOLDER, 'toc.yml'), "r") as legacy_toc:
    legacy_toc = yaml.safe_load(legacy_toc)

  toc_items = []
  files_for_move = []

  # filter that toc
  for index, top_level_toc_item in enumerate(legacy_toc):
    if check_against_targeted_namespaces(top_level_toc_item['uid'], migrating_namespaces_regexs):
      toc_items.append(top_level_toc_item)
      files_for_move += glob.glob(os.path.join(root_dir, LEGACY_SOURCE_FOLDER, top_level_toc_item['uid']+"*"))

  appended_content = yaml.dump(toc_items, default_flow_style=False)

  # write the toc
  with open(os.path.join(root_dir, TARGET_SOURCE_FOLDER, "toc.yml"), "a", encoding="utf-8") as stable_toc:
    stable_toc.write(appended_content)

for file_name in files_for_move:
  shutil.copy(file_name, os.path.join(root_dir, TARGET_SOURCE_FOLDER))
