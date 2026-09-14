# Data Warehouse ETL Project

Data warehouse and ETL project implemented using **MySQL**, **Pentaho Data Integration (Kettle)**, **Mondrian OLAP**, and **MDX queries**.

The project demonstrates the complete flow from an operational relational database to a dimensional data warehouse, including data extraction, transformation, loading, OLAP schema definition, and analytical querying.

## Project Overview

The project is organized around two main database layers:

- **Operational database**
- **Data warehouse**

The operational database contains the source transactional data.

The data warehouse contains transformed and structured data prepared for analytical processing.

The repository also includes ETL jobs and transformations, an OLAP schema, and MDX queries for analytical reporting.

## Main Components

The project includes:

- Operational database structure
- Operational database sample data
- Additional operational data
- Data warehouse structure
- ETL transformations
- ETL jobs
- Initial / total loading
- Incremental loading
- OLAP schema definition
- MDX analytical queries

## Technologies

The project uses:

- MySQL
- SQL
- Pentaho Data Integration
- Kettle transformations (`.ktr`)
- Kettle jobs (`.kjb`)
- Mondrian OLAP
- XML
- MDX

## Repository Structure

```text
Data-Warehouse-ETL-Project/
│
├── operativna-struktura.sql
├── operativna-podaci.sql
├── operativna-podaci-dodatno.sql
├── skladiste-struktura.sql
├── skladiste.xml
├── upiti-mdx.txt
├── punjenje/
├── .gitignore
└── README.md
```

## Operational Database

The operational database is defined in:

```text
operativna-struktura.sql
```

Initial source data is provided in:

```text
operativna-podaci.sql
```

Additional source data used for further or incremental loading is provided in:

```text
operativna-podaci-dodatno.sql
```

The operational database represents the transactional source from which data is extracted during the ETL process.

## Data Warehouse

The data warehouse structure is defined in:

```text
skladiste-struktura.sql
```

The warehouse is designed for analytical processing rather than transactional operations.

Data from the operational database is transformed and loaded into the warehouse through ETL processes.

## ETL Process

ETL stands for:

```text
Extract
Transform
Load
```

The ETL layer is implemented using **Pentaho Data Integration / Kettle**.

The ETL process performs tasks such as:

1. Reading source data from the operational database
2. Transforming source values
3. Preparing data for the warehouse model
4. Loading dimension data
5. Loading fact data
6. Supporting initial loading
7. Supporting incremental loading

The ETL files are located in:

```text
punjenje/
```

This directory contains Pentaho transformations and jobs.

## Total Load

The total load process is used to initially populate the data warehouse.

During the initial load, source data is extracted from the operational database, transformed, and inserted into the warehouse tables.

Conceptually:

```text
Operational Database
        |
        v
     Extract
        |
        v
    Transform
        |
        v
      Load
        |
        v
 Data Warehouse
```

## Incremental Load

The project also includes support for incremental loading.

Incremental loading processes only new or changed source data instead of reloading the complete operational dataset.

The additional source data file:

```text
operativna-podaci-dodatno.sql
```

can be used to simulate changes in the operational system and test incremental ETL execution.

## OLAP

The project includes an OLAP schema defined in:

```text
skladiste.xml
```

The schema is intended for use with **Mondrian OLAP**.

It defines analytical structures such as:

- Cubes
- Measures
- Dimensions
- Hierarchies
- Levels

These structures allow users to analyze warehouse data from multiple perspectives.

## OLAP Cubes

The project contains analytical cubes such as:

```text
Prodaja
Recenzija
```

These cubes are used for multidimensional analysis of warehouse data.

The exact measures, dimensions and hierarchy definitions are available in `skladiste.xml`.

## MDX Queries

Analytical queries are stored in:

```text
upiti-mdx.txt
```

The project uses **MDX (Multidimensional Expressions)** for querying OLAP cubes.

MDX enables analytical operations such as:

- Selecting measures
- Filtering dimensions
- Navigating hierarchies
- Comparing members
- Aggregating data across dimensions

The queries demonstrate how the data warehouse can be analyzed after the ETL process is completed.

## Project Flow

The complete project flow is:

```text
Operational Database
        |
        v
     ETL Process
        |
        v
   Data Warehouse
        |
        v
   Mondrian OLAP
        |
        v
     MDX Queries
        |
        v
 Analytical Results
```

## Running the Project

### 1. Create the Operational Database

Execute:

```text
operativna-struktura.sql
```

Then insert initial data using:

```text
operativna-podaci.sql
```

### 2. Create the Data Warehouse

Execute:

```text
skladiste-struktura.sql
```

### 3. Run ETL Processes

Open the transformations and jobs from:

```text
punjenje/
```

using Pentaho Data Integration.

Run the appropriate jobs or transformations to populate the warehouse.

### 4. Configure OLAP

Use:

```text
skladiste.xml
```

as the Mondrian OLAP schema.

### 5. Execute Analytical Queries

Use queries from:

```text
upiti-mdx.txt
```

to analyze the OLAP cubes.

## Concepts Demonstrated

This project demonstrates:

- Relational database design
- Data warehouse design
- ETL processing
- Initial data loading
- Incremental data loading
- Dimensional modeling
- Data transformation
- OLAP analysis
- Cube modeling
- MDX querying
- Separation of transactional and analytical systems

## Academic Project

This repository contains an academic project focused on information systems, data warehousing, ETL processing and OLAP analysis.