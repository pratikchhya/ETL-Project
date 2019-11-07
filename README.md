# ETL-Project - Columbus City Parking Violation

Columbus City Parking Violations dataset covers the parking violations identified by Parking Enforcement Officer (PEO) and the tickets issued for those violations. The data identifies the status of the ticket (e.g., paid, dismissed, etc.,) This dataset covers years 2013 through 2018. The Meters ID dataset contains identifiable information relating to each parking ticket issued based on Meter Ids. Metadata file provides information on the column names within the Columbus City Parking dataset. 

 - Size of the data is roughly over 235 MB.
 - Data ranging from 2013-2018.
 - The data is given in a CSV format and consists of 99 columns all of which add up to more than 745,822 rows of data.
 - Most of the columns; however, were not usable as they had null values or values for which did not correlate with meaningful data.
 - In the end, we ended up with 16 columns (Ticket_Id as primary key) and 19,725 rows with two years of data 2017-2018.
 
### Steps to Follow:

Open Git bash, activate your python envrionment and install libraries mentioned below:

 - install pandas
 - install sqlalchemy
 - install psycopg2
 - install datetime

Open Jupyter Notebook

### Data Sources 

  - 1st File - CSV File from Google Dirve Link 
    - https://drive.google.com/open?id=1nncijF9na3S-2AZlfNZCTvhvbPxcT8Te
  - 2nd File - Parking- Meters 
    - http://opendata.columbus.gov/datasets/parking-meters/data?geometry=-83.245%2C39.931%2C-82.812%2C40.023
  - 3rd File - Metadata 
    - https://data.world/smartcolumbusos/040b5929-db26-4453-920a-ceb282c4359f/workspace/file?filename=geocoded-parking-violations-csv-5.csv

### Flowchart 

![etl.png](etl.png)


### Connecting to local database

   ```sql
   rds_connection_string = "<username>:<password>@localhost:5432/parking_db"
   engine = create_engine(f'postgresql://{rds_connection_string}')
   ```
   - Create new dataframe with selected columns
   
   ```sql
    parking_fines_df = merge_df[['ticket_id', 'fine', 'amount_paid', 'date_issued', 'issue_time']].copy()
    parking_fines_df.reset_index(drop=True)
   ``` 
   - Make sure the above table(s) are created in postgres as well before you start the next steps
   
   - Check for tables
   
   ```sql
   engine.table_names()
   ``` 
   - Use pandas to load csv converted DataFrame into database
   
   ```sql
   parking_fines_df.to_sql(name='parking_fines', con=engine, if_exists='append', index=False)
   ```
   - Confirm data has been added by querying the table
     - NOTE: can also check using pgAdmin

   ```sql
   pd.read_sql_query('select * from parking_fines', con=engine).head()
   ```
   
### Challenges group faced
   
   1. Converting data type for column [Amount_paid] – Within the column there were two formats which made it difficult to convert it to        float at once. Multiple steps had to be done to change that column to float.
   2. Violation code - Had difficult time interpreting the violation codes as the violation codes changed as of 2018.
   3. Dropping rows with values of 0 for both latitude/longitude resulted in loss of three years of data.
 
### Conclusion
 
 Reason why these columns were selected is to bring awareness to different factors that contribute to parking violations.
  - Some of the questions to look into based on the final dataset:
     1. How many tickets were there as a total?
     2. How many tickets were per year during 2017-2018 and if there is any trend?
     3. Popular Car make which received the tickets?
     4. When are tickets most likely to be issued?
     5. Which entity (Unique system-generated number to identify license plate-based accounts) received the most ticket violations from 2017-2018?


