# Aries OCA Bundles

This GitHub repository is for hosting published Overlays Capture Architecture (OCA) Bundles to be used by Hyperledger Aries agents (issuers, holders, and verifiers).

The content of this repository is published on GitHub pages at [https://benmoumen.github.io/aries-oca-bundles/]. That's the place to go if you want to know:

- What Aries OCA Bundles are,
- How to use the OCA Bundles published from here,
- How to publish your own OCA Bundles.

The full source content for the OCA Bundles published from this repo is in the `OCABundles` repository.

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

This command mounts the `./OCABundles/schema/[issuer]/[sub-issuer(optional)]/[schema-name]` directory to the `/data` directory inside the container and runs the `oca-xls-parser` image with the specified Excel and JSON files.

## Generating OCA Bundles List

This script generates the `ocabundles.json` and `ocabundleslist.json` files. To execute the script, run the following command in your terminal:

```sh
./scripts/gen_ocabundlesjson.sh
```

## README Bundle Template

The `README_bundle_template.md` file serves as a template for the README.md file that should accompany each OCA Bundle. This template ensures that all necessary information about the OCA Bundle is included and consistently formatted.

### Template Structure

The template includes the following sections:

1. **Title**: The name of the OCA Bundle.
2. **Description**: A brief description of the OCA Bundle and its purpose.
3. **Schema Information**: Details about the schema used in the OCA Bundle.

### Example Template

Below is an example of the `README_bundle_template.md` file:

```markdown
# [OCA Bundle Name]

## Description

A brief description of the OCA Bundle and its purpose.

## Schema Information

- **Schema Name**: [Schema Name]
- **Version**: [Version]
- **Issuer**: [Issuer Name]
- **Sub-Issuer**: [Sub-Issuer Name (if applicable)]
```
