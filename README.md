[![Python application test with Github Actions using devcontainers](https://github.com/nogibjj/DY_Project-2/actions/workflows/main.yml/badge.svg)](https://github.com/nogibjj/DY_Project-2/actions/workflows/main.yml)

# Bash command-line tool to clean and truncate data
The objective of this project is to build a Bash command-line tool that performs a useful data preparation task such as cleaning data (especially handeling missing value rows), and truncating data based on specific criteria.


## Motivation
The motivation of this project is to help reducing time on mannually subsetting data based on different year or other specific criteria.

For example, the sample dataset contains Life Expectancy related data from a period of 2000 to 2015 for all the countries. It would be fine to use Excel mannually filtering on country's status, either developing or developed, then save the filtered data file twice; but think about doing it more than 5 times? For instance, it would be tedious and time-wasting to use Excel mannually filtering each year, followed by "saving as" with typing each year 15 times.

### Dataset
The Global Health Observatory (GHO) data repository under World Health Organization (WHO) keeps track of the health status as well as many other related factors for all countries The datasets are made available to public for the purpose of health data analysis. The dataset related to life expectancy, health factors for 193 countries has been collected from the same WHO data repository website and its corresponding economic data was collected from United Nation website. 

https://www.kaggle.com/datasets/kumarajarshi/life-expectancy-who
