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

### This talk

- is opinionated
- has a hidden agenda (wait for it)

### You need a basic understanding of

- Git
- Build pipelines
- (my) Humour

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
<span style="color:MediumSeaGreen">MAJOR.MINOR.PATCH</span>-<span style="color:DodgerBlue">BUILD_METADATA</span>\
<sub><sup>https://semver.org</sup></sub>

### <span style="color:MediumSeaGreen">MAJOR.MINOR.PATCH</span>

- Describes public API
- Incremented manually
- Relatively static

::: notes

- External
- Stored in
  - versionInfo.json (old school)
  - Git tag

:::

### <span style="color:DodgerBlue">BUILD_METADATA</span>

- Links artifacts to commits
- Determined by build system
- Changes all the time

::: notes

- Internal

:::

## Why link artifacts to commits?

### For traceability

- Build artifact ➡ Commit SHA
- 💤 Boring 💤

::: notes
Traceability means you can always find the version of code for any artifact/release/installer/installation. In open source, this concept is not that important anymore since distribution of build output is just for convenience
:::

### Keep track of all moving parts

- Commit SHA ➡ Build artifacts
- 🎈 Fun! 🎈

::: notes
It's fun, especially with multiple parts as will see
:::

## A system with multiple parts

![alt text](images/pipeline.png)
