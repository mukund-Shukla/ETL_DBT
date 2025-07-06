**Movie Data ELT Project**
This project showcases a complete Data Engineering project focused on building a robust and scalable data pipeline for movie data. The project demonstrates a modern ELT (Extract, Load, Transform) approach, with dbt (data build tool) at its core, highlighting its power in transforming and preparing data for analytical purposes.

**Requirements**

1. AWS with access to S3
2. Snowflake Data Warehouse
3. DBT package installed



**Project Overview**

The primary goal of this project was to ingest raw movie data, transform it into a structured and analyzable format, and make it readily available for reporting and visualization. We leveraged a combination of AWS S3 Bucket, Snowflake, and dbt to achieve this.

**Data Source**
The dataset used in this project is sourced from GroupLens.org, specifically the MovieLens 20M Dataset (https://grouplens.org/datasets/movielens/20m/). This comprehensive dataset includes various CSV files, including:

1. movies.csv: Contains complete movie data.
2. ratings.csv: User ratings for movies.
3. tags.csv: All tags for movies.
4. links.csv: Identifiers that can be used to link to other sources of movie data
5. genome-scores.csv
6. genome-tags.csv
7. Architecture and Data Flow

**The project follows a well-defined ELT architecture, emphasizing efficiency and maintainability:**

**Extract & Load (EL):**

Data Ingestion to S3: The raw CSV data files from GroupLens were initially uploaded to an Amazon S3 bucket. S3 served as a secure and scalable landing zone for our raw data.
Loading to Snowflake: From the S3 bucket, the data was loaded into Snowflake, our cloud-native data warehouse. A Snowflake stage was created, using AWS credentials, to seamlessly transfer all the data from S3 into Snowflake data warehouse. This step completes the "Extract" and "Load" phases, making the raw data available in our data warehouse.

**Transform (T) - The Power of dbt:**

Raw Data Layer: Upon loading into Snowflake, a Raw Data Layer was created. This layer consists of tables that are direct copies of the original CSV datasets from S3, preserving the raw state of the data.
Staging Layer (Views with dbt Models): This is where dbt truly shines. The "Staging Layer" is built entirely using dbt Models, which are SQL statements running in dbt. Each dbt Model in this layer represents a single transformation step on the raw data. This approach offers several benefits, including modularity and reusability. dbt Tests (e.g., not_null, unique) were extensively used to ensure data quality at this crucial stage.
Dimensional/Fact Layer (Dev Data): Following the staging layer, a "Dev Layer" (or Production Layer) was created. This layer consists of denormalized dimension tables (e.g., dim_movies, dim_users) and fact tables (e.g., fact_ratings). These tables are also built using dbt Models, further transforming and joining data from the staging layer to create a star-schema-like structure ideal for analytical queries and business intelligence.

Reusable Logic with Macros: To promote code reusability and maintainability, dbt Macros were also used. These Jinja-based SQL functions encapsulate common logic, such as standardized casting or date formatting, ensuring consistency across our models.

Slowly Changing Dimensions (SCD) with Snapshots: For tracking changes in tables, dbt Snapshots were implemented. This allowed us to capture and maintain a history of changes to specific attributes over time, providing accurate historical context for analysis.
