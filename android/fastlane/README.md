fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## Android

### android build_dev

```sh
[bundle exec] fastlane android build_dev
```

Build app for development environment

### android move_dev_files

```sh
[bundle exec] fastlane android move_dev_files
```

move files from development build to artifacts

### android deploy_dev_firebase

```sh
[bundle exec] fastlane android deploy_dev_firebase
```

Deploy a new version for development environment to the Firebase App Distribution

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
