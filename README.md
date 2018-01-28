# Haskell CI

[![Build Status](https://travis-ci.org/joshbohde/haskell-ci.svg?branch=master)](https://travis-ci.org/joshbohde/haskell-ci)
[![Build status](https://ci.appveyor.com/api/projects/status/t7o07pay4d5bufsb?svg=true)](https://ci.appveyor.com/project/JoshBohde/haskell-ci)
[![GitHub release](https://img.shields.io/github/release/joshbohde/haskell-ci.svg)](https://github.com/joshbohde/haskell-ci/releases)

A Travis CI & Appveyor template to test your Haskell application and publish binary releases for Linux, Mac and Windows on Github.

Inspired by [trust](https://github.com/japaric/trust).

## Why

Haskell binaries usually have install instructions of `cabal install` or `stack install`. At best, this requires users to spend time downloading and compiling packages. Sometimes this requires debugging package or LTS versions, and may prevent folks from ever getting started.

This template allows you to provide prebuilt binaries for your users, saving time.

## Install

### Things you'll need

* A Haskell package hosted on GitHub
* A [Travis CI account](https://travis-ci.org/)
* An [Appveyor cccount](https://www.appveyor.com/)

### Enable your repository

1. Enable your repository in Travis CI by visiting [your dashboard](https://travis-ci.org/) and visiting your profile.
2. Enable your repository in Appveyor by visiting [the new project page](https://ci.appveyor.com/projects/new) and adding your repository.

### Copy the template

1. Copy the `ci` directory, and the `appveyor.yml` and `.travis.yml` files into your project directory.
2. In `appveyor.yml` and `.travis.yml`, follow the instructions for each `TODO` section.
3. Commit those changes, and push them to your repository.
4. You should now see your project being built on your [Travis CI dashboard](https://travis-ci.org/), and your [Appveyor projects page](https://ci.appveyor.com/projects).

## Using

In order to have Travis CI and Appveyor build binaries for you, you'll need to push a [git tag](https://git-scm.com/book/en/v2/Git-Basics-Tagging) that adheres to the [Package Versioning Policy](https://pvp.haskell.org/).

For example, if you were to release version `1.2.1`, you'd do the following:

```
# Do your usual release process
$ git tag v1.2.1
$ git push --tags
```

At this point, Travis CI and Appveyor will recognize this as a release, will build binaries for Linux, Mac, and Windows, and create a new GitHub release with those binaries. For example, see this projects [release page](https://github.com/joshbohde/haskell-ci/releases).
