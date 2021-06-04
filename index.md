---
author-meta:
  - Wesley Yarde
date-meta: June 10, 2021
pagetitle: How (not) to store build metadata in Git
---

## $pagetitle$

$author-meta$
\
$date-meta$

## Disclaimers

This talk

- ...is opinionated
- ...has a hidden agenda (wait for it)

## What is build metadata

Build metadata is fancy for build ID.\
It identies a build and the artifacts it generates.
\
\
Artifacts could be:

- containers
- packages

## Semantic Versioning 2.0.0

\
<span style="color:MediumSeaGreen">MAJOR.MINOR.PATCH</span>-<span style="color:DodgerBlue">BUILD_METADATA</span>

### <span style="color:MediumSeaGreen">MAJOR.MINOR.PATCH</span>

- Incremented manually
- Stored in
  - versionInfo.json (old school)
  - Git tag

### <span style="color:DodgerBlue">BUILD_METADATA</span>

- Determined by build system
- Only known after the commit

## Why store the build ID

- For traceability (boring)
- Keep track of all moving part

## Attempt 1: versionInfo.json

Pro:

- Does not rely on Git

Con:

- Pollutes Git history
- BUILDMETADATA together with MAJOR.MINOR.PATCH

## Attempt 2: Git commit

## Attempt 3: Git Notes
