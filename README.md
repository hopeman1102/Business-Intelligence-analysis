# **Data Warehouse & Business Intelligence**
The objective behind this data warehouse is to be able to derive business intelligence for the Gardaí and provide insights
in order to regulate and reduce the occurrence of crimes in the country.

## **Dataset** 
Data was collated from multiple sources -
1. Gardaí offences data – This data is a structured set of data and our primary source available on the www.data.gov.ie website. 
This data includes the number of offences for each type of crime, in all the Gardaí stations across the country. 
Each station is mapped to one of the 26 divisions of Republic of Ireland. 
Data is downloaded from the website in CSV format. 
URL: https://data.gov.ie/dataset/crimes-at-garda-stations-level-2010-2016

2. Wikipedia data – Our second set of data is a semi-structured dataset extracted from a Wikipedia page. 
This data consists of the population and province for each of the divisions of Ireland. We have extracted this dataset using the R and have subsequently cleansed the data in the
same code. Some unwanted rows related to Northern Ireland and some unrequired columns have been removed. 
URL: https://en.wikipedia.org/wiki/List_of_Irish_counties_by_population

3. Twitter Sentiment data – Have also extracted tweets to run a sentimental analysis based on certain keywords such as “extortion”, “assault”, “theft”, “kidnapping”, “violence”, “murder”. 
Each time we have entered the name of the division to generate tweets related to that area, performed a sentimental analysis and saved the score in a different data frame. 
This data frame consisting of the sentiment score for all 26 divisions have been written out to a CSV from the R code.

4. Mock data - To aid our analysis we have mocked data which was unavailable with the Irish CSO and other Irish data websites. 
We have generated an unemployment rate (in %) and depression level (score of 0-100) for each of the 26 divisions for 4 years. 
This is required to do comparative analysis on the occurrence of different crime types and whether any relation exists. 
This data has been downloaded and structured in CSV format.

## **Architecture**
The Kimball approach uses bottom-up approach and implements the generation of multi-dimensional tables around a central fact table. 
This data will be extracted and transformed to be housed in a data mart. This method advocates denormalization of data across the warehouse
For our project, we have used the Kimball approach, where data from multiple sources are housed in the staging area, undergo ETL process and used to build the data warehouse. 
Then we finally use OLAP to derive reports and analysis for our end client.

## **ETL**
Our ETL process is carried out in Integration Services in Visual Studio. We first truncate our raw data tables to remove all values and load the data on to it. 
This is done so that if there is a change in the source data, it will reflect in our data warehouse. 
This ETL process is re-runnable and is executed each time we wish to generate our fact and dimension tables.

After the data is loaded in to the raw tables in the staging area, we generate our dimension and fact tables. 
We start off by truncating our dimension tables, before we load data from the raw tables on to it. 
After our dimension tables, the fact table is created and the measures as well as primary keys loaded on to it. 
The creation of fact and dimension tables are achieved through running EXECUTE SQL TASK and using SQL JOIN queries to merge the data from the raw tables as per our business requirements.

## **Cube Deployment and BI Queries**
After our Fact and Dimension tables are created, we move to the Analysis Services of Visual Studio to deploy our cube. 
Our dimensional model of star schema is generated over here. 

Once cube is generated, we visualize our data to express 3 non trivial BI queries in Tableau.

## **Video Link**
[See the demonstration](https://youtu.be/SISfGy7QiFc)
