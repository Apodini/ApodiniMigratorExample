<!--

This source file is part of the Apodini open source project

SPDX-FileCopyrightText: 2021 Paul Schmiedmayer and the project authors (see CONTRIBUTORS.md) <paul.schmiedmayer@tum.de>

SPDX-License-Identifier: MIT

-->

# Apodini Migrator Example

<p align="center">
  <img width="200" src="https://github.com/Apodini/ApodiniMigrator/blob/develop/Resources/logo.png">
</p>

[![License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/Apodini/ApodiniMigratorExample/blob/develop/LICENSES)
[![swift-version](https://img.shields.io/badge/Swift-5.5-orange.svg)](https://github.com/apple/swift)
[![REUSE Compliance Check](https://github.com/Apodini/ApodiniMigratorExample/actions/workflows/reuseaction.yml/badge.svg)](https://github.com/Apodini/ApodiniMigratorExample/actions/workflows/reuseaction.yml)
[![Build and Test](https://github.com/Apodini/ApodiniMigratorExample/actions/workflows/build-and-test.yml/badge.svg)](https://github.com/Apodini/ApodiniMigratorExample/actions/workflows/build-and-test.yml)

This repository contains an example project that introduces `ApodiniMigrator` functionality in an [Apodini](https://github.com/Apodini/Apodini) Web Service. It consists of two targets `QONECTIQV1` and `QONECTIQV2`, both implementing an example Web Service and use `Migrator` configuration. Random changes in the models and `Handler`s have been applied on the first version `QONECTIQV1` that resulted in `QONECTIQV2`.

## Usage
Below the `configuration` property of `QONECTIQV1` Web Service:

```swift
var configuration: Configuration {
    REST()
    
    Migrator(
        // exports the document of the current version at http://localhost/api-document in `yaml` format
        documentConfig: .export(.endpoint("api-document", format: .yaml))
    )
}
```
`Migrator` configuration offers the possibility to configure handling of the `Document` of the current version and generation of the migration guide. Obviously, the inital version of the Web Service does not require a migration guide configuration. In `QONECTIQV2` we configure the Web Service as follows:

```swift
var configuration: Configuration {
    REST()
    
    Migrator(
        // exports the document of the current version at directory `data` in `json` format
        // `ApodiniMigration` creates intermediary directories if they do not exist,
        // .directory export option might be useful during development to inspect the content
        documentConfig: .export(.directory("./Documents")),
        // compares the current API with the document stored at `Bundle.module`,
        // and exports the automatically generated migration guide at http://localhost/migration-guide in a `json` format
        migrationGuideConfig: .compare(
            .resource(.module, fileName: "api_qonectiq1.0.0", format: .json),
            export: .endpoint("migration-guide", format: .json)
        )
    )
}
```

`ApodiniMigration` offers configuration options to export its items to either a local `directory` of the web service application or exposing at a specific endpoint in either `json` or `yaml` format. `MigrationGuideConfiguration` also supports reading of the migration guide either from the bundle or a local path, e.g. `migrationGuideConfig: .read(.file("./migration_guide.yaml"), export: .endpoint("migration-guide"))`. Additionally, `ApodiniMigration` stores by default its items in the application storage of the Web Service, which can be accessed as follows:

```swift
let document = app.storage.get(MigratorDocumentStorageKey.self)
let migrationGuide = app.storage.get(MigrationGuideStorageKey.self)
```

Once `Migrator` is registered in the `configuration` property of the Web Service, it automatically registers a `migrator` subcommand to the web service 
consisting of three subsubcommands, which can start or run your Apodini Web Service:

```console
$ swift run QONECTIQV1 migrator --help
OVERVIEW: Root subcommand of `ApodiniMigrator`

Starts or runs an Apodini web service based on the configurations of a subsubcommand

USAGE: qonectiqv1 migrator <subcommand>

OPTIONS:
  --version               Show the version.
  -h, --help              Show help information.

SUBCOMMANDS:
  document (default)      A parsable command for generating the API document of
                          the initial web service version
  read                    A parsable command to export a local migration guide
                          and the API document of the current version
  compare                 A parsable command for generating the migration guide
```

For the initial version of the Web Service `document` subsubcommand can be used as follows to expose the document of the current version at `./data` directory as `yaml`:

```console
$ swift run QONECTIQV1 migrator document --doc-directory=./Documents --doc-format=json
info org.apodini.migrator : API Document exported at ./Documents/api_qonectiq1.0.0.json in json format
```

By default, `migrator` subsubcommands simply start the web service to execute migration related tasks and exit afterwards. If you want to additionally run 
the web service via a `migrator` subsubcommand, include `--run-web-service` flag, e.g.: 

```console
$ swift run QONECTIQV1 migrator document --doc-endpoint=api-document --doc-format=yaml --run-web-service
info org.apodini.migrator : API Document served at /api-document in yaml format
info org.apodini.application : Server starting on 0.0.0.0:80
```

For the future versions of the Web Service, one can make use of either `read` or `compare` subsubcommands of `migrator` to additionally export the migration guide: (Use `swift run WEBSERVICENAME migrator compare --help` or `swift run WEBSERVICENAME migrator read --help` to get an overview of the required arguments)


```console
$ swift run QONECTIQV2 migrator compare --old-document-path ./Documents/api_v1.0.0.json --doc-endpoint api-document --guide-endpoint migration-guide --run-web-service
info org.apodini.migrator : API Document served at /api-document in json format
info org.apodini.migrator : Migration Guide served at /migration-guide in json format
info org.apodini.application : Server starting on 0.0.0.0:80
```

The configurations provided via CLI arguments overwrite the configuration in source code in the `configuration` property of the web service. Provided with a `Document` and a Migration guide, one can make use of `migrator` CLI (see [example](https://github.com/Apodini/ApodiniMigrator#apodinimigratorexample)) to automatically generate or migrate an intermediary client library. Corresponding documents of this example project (documents of the first and second version and their migration guide) can be found in [Documents](https://github.com/Apodini/ApodiniMigratorExample/tree/develop/Documents).

The following script demonstrates pulling, building, and running the Apodini Migrator to generate a client library of version 1 of the web service migrated to talk to version 2:
```console
$ git clone https://github.com/Apodini/ApodiniMigrator
$ cd ApodiniMigrator
$ git checkout 0.2.1
$ swift run migrator migrate --package-name ApodiniMigratorExampleClient --target-directory ../ --document-path ../Documents/api_v1.0.0.json --migration-guide-path ../Documents/migration_guide.json
info org.apodini.migrator.rest : Starting migration of package ApodiniMigratorExampleClient
info org.apodini.migrator.rest : Package ApodiniMigratorExampleClient was migrated successfully. You can open the package via ApodiniMigratorExampleClient/Package.swift
```

The resulting client library can be inspected in the `ApodiniMigratorExampleClient` folder, the files have only been updated to contain a REUSE compatible licensing information.

## Contributing
Contributions to this project are welcome. Please make sure to read the [contribution guidelines](https://github.com/Apodini/.github/blob/main/CONTRIBUTING.md) and the [contributor covenant code of conduct](https://github.com/Apodini/.github/blob/main/CODE_OF_CONDUCT.md) first.

## License
This project is licensed under the MIT License. See [License](https://github.com/Apodini/ApodiniMigratorExample/blob/develop/LICENSES) for more information.
