{
  "build": {
    "content": [
      {
        "files": [
          "**/*.yml"
        ],
        "exclude": [
          "**/toc.yml"
        ],
        "src": "api-ref",
        "dest": "."
      },
      {
        "files": [
          "toc.yml"
        ],
        "src": "api-ref",
        "dest": "."
      },
      {
        "files": [
          "index.md"
        ],
        "src": "api-index",
        "dest": "."
      },
      {
        "files": [
          "toc.yml"
        ],
        "src": "breadcrumb",
        "dest": "breadcrumb"
      },
      {
        "files": [
          "**/*.md"
        ],
        "src": "documentation",
        "dest": "documentation"
      }
    ],
    "resource": [
      {
        "files": [
          "**/*.png",
          "**/*.jpg"
        ],
        "exclude": [
          "**/obj/**",
          "azure/sdk/java/**",
          "**/includes/**"
        ]
      }
    ],
    "overwrite": "api-doc/*.md",
    "externalReference": [],
    "globalMetadata": {
        "breadcrumb_path": "~/breadcrumb/toc.yml"
    },
    "fileMetadata": {},
    "template": [
      "docs.html"
    ],
    "dest": "azure/sdk/java"
  }
}