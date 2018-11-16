# Cloud Foundry HWC Buildpack

A Cloud Foundry [buildpack](http://docs.cloudfoundry.org/buildpacks/) for Windows applications.

Additional information can be found at [CloudFoundry.org](http://docs.cloudfoundry.org/buildpacks/).

## Dependencies
- [Golang Windows](https://golang.org/dl/)
- [Ginkgo](https://onsi.github.io/ginkgo/)
- [Hostable Web Core](https://github.com/cloudfoundry-incubator/hwc)

### Building the Buildpack
To build this buildpack, run the following command from the buildpack's directory:

1. Source the .envrc file in the buildpack directory.
```bash
source .envrc
```
To simplify the process in the future, install [direnv](https://direnv.net/) which will automatically source .envrc when you change directories.

1. Install buildpack-packager
```bash
./scripts/install_tools.sh
```

1. Build the buildpack
```bash
buildpack-packager build
```

1. Use in Cloud Foundry
Upload the buildpack to your Cloud Foundry and optionally specify it by name

```bash
cf create-buildpack [BUILDPACK_NAME] [BUILDPACK_ZIP_FILE_PATH] 1
cf push my_app [-b BUILDPACK_NAME]
```

### Testing
Buildpacks use the [Cutlass](https://github.com/cloudfoundry/libbuildpack/cutlass) framework for running integration tests.

To test this buildpack, run the following command from the buildpack's directory:

1. Source the .envrc file in the buildpack directory.

```bash
source .envrc
```
To simplify the process in the future, install [direnv](https://direnv.net/) which will automatically source .envrc when you change directories.

1. Run unit tests

```bash
./scripts/unit.sh
```

1. Run integration tests

```bash
./scripts/integration.sh
```

More information can be found on Github [cutlass](https://github.com/cloudfoundry/libbuildpack/cutlass).

### SafeNet Luna Network HSMs

To connect an application to Luna HSMs, create a Luna user provided service as documented at [Luna User Provided Service](https://github.com/cloudfoundry/java-buildpack/blob/master/docs/framework-luna_security_provider.md).

The Luna client cryptoki.dll along with a .NET PKCS11 wrapper such as [Pkcs11Interop](https://www.pkcs11interop.net/) need to be packaged with the application.

### Help and Support

Join the #greenhouse channel in our [Slack community](http://slack.cloudfoundry.org/) if you need any further assistance.

### Active Development

The project backlog is on [Pivotal Tracker](https://www.pivotaltracker.com/n/projects/1042066).
