---
author-meta:
  - Wesley Yarde
date-meta: June 10, 2021
pagetitle: How (not) to store build metadata in Git
url-gh: https://github.com/wyarde
url-gino-keva: https://github.com/philips-software/gino-keva
url-demo: https://github.com/wyarde/talk-store-build-metadata-in-git/tree/demo
url-talk: https://wyarde.github.io/talk-store-build-metadata-in-git
---

## $pagetitle$

## $author-meta$

|  ![](images/wyarde.jpg){width=40%}  |
| :---------------------------------: |
|        [$url-gh$]($url-gh$)         |
|           Devops Engineer           |
|       Cardiology Informatics        |
| ![](images/philips.png){width=50px} |

## Disclaimers

### This talk

- is opinionated
- includes a live demo

### You need a basic understanding of

> - Git
> - Containers
> - Build pipelines
> - (my) Humour

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

\
Build artifact ↔ Commit SHA

### For traceability

> - Build artifact ➡ Commit SHA
> - 💤 Boring 💤

::: notes
Traceability means you can always find the version of code for any artifact/release/installer/installation. In open source, this concept is not that important anymore since distribution of build output is just for convenience
:::

### Keep track of all moving parts

> - Commit SHA ➡ Build artifacts
> - 🎈 Fun! 🎈

::: notes
It's fun, especially with multiple parts as will see
:::

## Multiple moving parts

![New feature, build 46](images/pipeline.png)

::: notes

Determine changes:

- Identifies what has changed

Build:

- Each component has an independent build, which can run in parallel
- Also run tests for each component
- Output is a docker container

Release:

- Collect all containers
- Release them

:::

### Git history

![](images/git_history.png)

## Challenges

1. Where to store it
2. How to store/retrieve it

## 1. Where to store it

> - In Git
> - ...but not in commits
> - Git tags?
> - Git notes!

![](images/git_history.png){width=60%}

::: notes

- Using versionInfo.json is a very silly idea
- Since one end of the link is a git commit, storing in git makes a lot of sense
- A commit would be horrible; it pollutes the history and doesn't even work
- Tags have 2 drawbacks: Explosion of tags and doesn't support concurrent use
- Git notes are perfect!

:::

### Git notes

<sub><sup>_Supplement a commit message without changing the commit itself_</sup></sub>

- <span style="color:Moccasin">`git notes add|remove|show|list`</span>
- Stored as commits in refs/notes/

## 2. How to store/retrieve it

- Store key/values in a note
- List key/values for a commit

### Gino Keva

:::{.element: class="fragment" data-fragment-index="1"}
A simple Git Notes Key Value store
:::

:::{.element: class="fragment" data-fragment-index="2"}
[$url-gino-keva$]($url-gino-keva$)
:::
:::{.element: class="fragment" data-fragment-index="3"}
![](images/wyarde.jpg)
![](images/your_face.jpg)
:::

::: notes

Awesome open-source tool

:::

# Demo

![](images/pipeline.png)

# End

|                    Gino Keva                    |                 Demo                  |               This talk               |
| :---------------------------------------------: | :-----------------------------------: | :-----------------------------------: |
| [![](images/qr_gino-keva.png)]($url-gino-keva$) | [![](images/qr_demo.png)]($url-demo$) | [![](images/qr_talk.png)]($url-talk$) |
