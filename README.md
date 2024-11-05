# Aries OCA Bundles

This GitHub repository is for hosting published Overlays Capture Architecture
(OCA) Bundles to be used by Hyperledger Aries agents (issuers, holders and
verifiers).

The content of this repository is published on GitHub pages at [https://benmoumen.github.io/aries-oca-bundles/]. That's the place to go if you want to know:

- what Aries OCA Bundles are,
- how to use the OCA Bundles published from here,
- how to publish your own OCA Bundles, and

The full source content for the OCA Bundles published from this repo are in the `OCABundles` repository.

There are several scripts in the `scripts` folder that are used to generate OCABundles and the GH Pages site.

## Using the Dockerfile to Generate OCA Bundle

You can use the provided Dockerfile to generate an OCA Bundle within a Debian container that includes all the required dependencies.

### Building the Docker Image

To build the Docker image, run the following command:

```sh
docker build --platform linux/amd64 -t oca-xls-parser .
```

### Running the Docker Container

To run the Docker container and generate the OCA Bundle, use the following command:

```sh
docker run --platform linux/amd64 --rm -v ./OCABundles/schema/unctad/[schema-name]:/data oca-xls-parser -x OCA.xlsx branding.json
```

This command mounts the `./OCABundles/schema/world-credentials/[schema-name]` directory to the `/data` directory inside the container and runs the `oca-xls-parser` image with the specified Excel and JSON files.