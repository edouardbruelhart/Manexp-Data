# Manexp-Data

[![Build status](https://img.shields.io/github/actions/workflow/status/edouardbruelhart/Manexp-Data/main.yml?branch=main)](https://github.com/edouardbruelhart/Manexp-Data/actions/workflows/main.yml?query=branch%3Amain)
[![codecov](https://codecov.io/gh/edouardbruelhart/Manexp-Data/branch/main/graph/badge.svg)](https://codecov.io/gh/edouardbruelhart/Manexp-Data)
[![Commit activity](https://img.shields.io/github/commit-activity/m/edouardbruelhart/Manexp-Data)](https://img.shields.io/github/commit-activity/m/edouardbruelhart/Manexp-Data)
[![License](https://img.shields.io/github/license/edouardbruelhart/Manexp-Data)](https://img.shields.io/github/license/edouardbruelhart/Manexp-Data)

This repository aggregates and transforms data originating from multiple third-party sources, including public institutions and open data platforms for Manexp-Web project.

**Github repository**: <https://github.com/edouardbruelhart/Manexp-Data/>

**Documentation** <https://edouardbruelhart.github.io/Manexp-Data/>

## Available datasets:

- ### Seeds:

Cleaned, resolved, translated, iconed and colored official european seeds dataset with related commercial crops denomination and information

Source documentations:

    - https://food.ec.europa.eu/plants/plant-reproductive-material/plant-variety-catalogues-databases-information-systems_en
    - https://www.upov.int/en/find-and-explore/databases/genie

Source datasets:

    - https://ec.europa.eu/food/plant-variety-portal/index.xhtml
    - https://www.upov.int/genie/reports/twp.xhtml?faces-redirect=true
    - https://www.upov.int/genie/updates/upov_code.xhtml?lang=en
    - https://github.com/pycountry/pycountry

- ### Phytosanitary products

Cleaned phytosanitary products dataset

Source documentation:

    https://www.blv.admin.ch/fr/index-des-produits-phytosanitaires

Source dataset:

    https://www.blv.admin.ch/dam/fr/sd-web/He9bAfs8CmFT/daten-pflanzenschutzmittelverzeichnis-fr.zip

## Getting data

The datasets are available as a PostgreSQL database. To get your own dataset version on your host, follow these few steps:

### 1. Make sure to have docker installed and populate .env according to your needs

Check that docker is installed. It should return something like: Docker version xx.x.x, build xxxx. If this is not the case, install it.

```bash
docker --version
```

Copy the .env.example file and rename it to .env. Use vim or any other text editor to edit it
```bash
cp .env.example .env

chmod 600 .env # make .env available only for you

vim .env
```

### 2. Create and configure the database

Run this command once in the root directory of the repository:

```bash
./scripts/configure_database.sh
```

### 3. Run the ingestion pipeline

Run this command in the root directory of the repository when you want to update the database:

```bash
./scripts/ingest_data.sh
```

### 4. Access database

You can access the database using any PostgreSQL client or tool of your choice. The docker-compose.yaml file is configured to expose database only on your own host (127.0.0.1:<POSTGRES_PORT>). Feel free to modify the configuration to connect to a different host or port if needed.

### 5. Remove the database and stop the containers

To remove the database and stop the containers, run this command in the root directory:

Be careful, it will erase all, including the database and all the data stored in it.

```bash
docker compose down --volumes --remove-orphans
```

## [Contributing](https://github.com/edouardbruelhart/Manexp-Data/blob/main/CONTRIBUTING.md)

Contributions are welcome, and they are greatly appreciated!

## [Data sources](https://github.com/edouardbruelhart/Manexp-Data/blob/main/DATA_SOURCES.md)

This project depends on external datasets from third-party sources, including public institutions and open data platforms.   All sources, attribution details, and transformation notes are documented in **DATA_SOURCES.md**.
