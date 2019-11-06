# ETL-Project

Columbus City Parking Violations dataset covers the parking violations identified by Parking Enforcement Officer (PEO) and the tickets issued for those violations. The data identifies the status of the ticket (e.g., paid, dismissed, etc.,) This dataset covers years 2013 through 2018. The Meters ID dataset contains identifiable information relating to each parking ticket issued based on Meter Ids. Metadata file provides information on the column names within the Columbus City Parking dataset. 

### Steps to Follow:

Open Git bash, activate your python envrionment

#### Make sure to install this before running:
 - pip install pandas
 - pip install sqlalchemy
 - pip install psycopg2
 - pip install datetime

Open Jupyter Notebook

Three files you would need - 
  - 1st File - CSV File from Google Dirve Link - https://drive.google.com/open?id=1nncijF9na3S-2AZlfNZCTvhvbPxcT8Te
  - 2nd File - Parking- Meters - http://opendata.columbus.gov/datasets/parking-meters/data?geometry=-83.245%2C39.931%2C-82.812%2C40.023
  - 3rd File - Metadata - https://data.world/smartcolumbusos/040b5929-db26-4453-920a-ceb282c4359f/workspace/file?filename=geocoded-parking-violations-csv-5.csv

 - Size of the data is roughly over 235 MB.
 - Data ranging from 2013-2018.
 - The data is given in a CSV format and consists of 99 columns all of which add up to more than 745,822 rows of data.
 - Most of the columns; however, were not usable as they had null values or values for which did not correlate with meaningful data.
 - In the end, we ended up with 16 columns (Ticket_Id as primary key) and 19,725 rows with two years of data 2017-2018.

#### Flowchart 

![etl.png](etl.png)

#### Challenges

 1. 
 2.
 3.
 4.
 5.
