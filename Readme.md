# Spotify Data Pipeline (ETL) Project Using Python

## Project Description:
The Spotify Data Pipeline (ETL) Project Using Python leverages the power of AWS cloud services to automate the extraction, transformation, and loading (ETL) process of Spotify API data. This project seamlessly transforms raw data from the Spotify API into a structured and query-ready dataset, enabling insightful data analysis and visualization.

### Project Overview:

In this project, we build a comprehensive data pipeline that efficiently handles Spotify API data using AWS services and Python programming.

> About Data set : For this projct spotify top global 100 songs playlist used this will update every week.

## Project Architecure
<img src="Attachments\Spotify ETL Architecture_AWS.png" width=700>

## 1. Data Extraction

Utilize Python scripts to extract data from the Spotify API, capturing valuable insights about album, artist, songs data's.
Deploy the data extraction code onto **AWS Lambda Functions**, which provide a serverless environment for executing code on demand.
Set up scheduled triggers using Amazon coludWatch to run the extraction code on a **weekly basis**.
Store the raw data securely in **Amazon S3 bucket**, a scalable and cost-effective storage solution.

<img src='Attachments\raw_data_s3.png' width=700>

## 2. Data Transformation

Configure **AWS Lambda Functions** to trigger automatically upon the arrival of new data in the **Amazon S3 bucket**.
Implement Python-based data transformation logic within AWS Lambda Functions to clean, enrich, and format the raw data.
Store the transformed data back into a designated **Amazon S3 bucket container**, ensuring data integrity and accessibility.

<img src='Attachments\transformed_data_s3.png' width =700>

## 3. Data Loading

Create an snowflake pipeline to load the data when new data lands in the **Amazon S3 bucket container**.

<img src='Attachments\Event_notification_snowpipe.png' width=700>

## 4. Data Reporting

ingest the data from snowflake database and create spotify API dashboard using power BI.

**power BI Spotify dashboard** \
<img src='Attachments\Spotify_dashboard_page-0001.jpg' width=700>

**snowflake data base** \
<img src='Attachments\snowflae_sp_database.png' width=250>

## Key Components

- AWS Lambda : Provides serverless compute for data extraction and transformation.

- AWS S3 : Serves as a reliable and scalable storage solution for raw and transformed data.

- Amazon Cloud watch : Enables automated scheduling of data extraction tasks.

- Amazon Object trigger : Enables automated schedule trigger when data is arrived on S3 bucket folder.

- snowflake database: To load the data from s3 querying of the transformed dataset using SQL.

## Programming and Tools

Python is used extensively for data extraction, transformation, and processing, employing Pandas DataFrames for efficient data manipulation.
