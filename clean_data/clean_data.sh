#!/bin/bash
dir='data_cleaning'
if [[ ! -e $dir ]]; then
    mkdir $dir
    echo "The directory was created"
elif [[ $(ls -A $dir) ]]; then
    rm -v $dir
    echo "The directory was emptied"
fi


#clean missing rows
echo "Would you like to drop missing values? [yes/no]"
read drop_rows
if [[ "$drop_rows" == "yes" ]]
then
    #drop rows with any missing values
    awk -F"," '{for(i=1;i<=NF;i++){if($i==""){next}}}1' data/LifeExpetancy.csv >data_cleaning/LifeExpetancy_NoMissingValues_data.csv
    echo "Rows have been dropped - see LifeExpetancy_NoMissingValues_data.csv"
    current_data='data_cleaning/LifeExpetancy_NoMissingValues_data.csv'
else [[ "$drop_rows" == "no" ]]
    echo "You chose not to drop missing values. Moving to next step."
    current_data='data/LifeExpetancy.csv'
fi

#truncate data based on country status
echo "Would you like to split data based on country status (Developing & Developed)? [yes/no]"
read split_data
if [[ "$split_data" == "yes" ]]
then
    #check if directory exists and is empty, otherwise empties or creates directory
    split_dir='data_split'
    if [[ ! -e $split_dir ]]
    then
        mkdir $split_dir
        echo "directory for split data was created: data_split"
    elif [[ $(ls -A $split_dir) ]]
    then
        rm -v $split_dir
        echo "data_split was emptied"
    fi
    #split data into files depending on gender

    awk -F ',' '$3 == "Developing" {print > ("data_split/developing_countries_data.csv"); next} {print > ("data_split/developed_countries_data.csv")}' $current_data
else
    echo "You chose not to split the dataset, your cleaned data is under: $current_data"
fi

#truncate data based on year
echo "Would you like to split data based on year? [yes/no]"
read split_year
if [[ "$split_year" == "yes" ]]
then
    #check if directory exists and is empty, otherwise empties or creates directory
    split_dir='data_split'
    if [[ ! -e $split_dir ]]
    then
        mkdir $split_dir
        echo "directory for split data was created: data_split"
    elif [[ $(ls -A $split_dir) ]]
    then
        rm -v $split_dir
        echo "data_split was emptied"
    fi
    #split data into files depending on year
    awk '{print > ("data_split/LifeExpetancy_year_" $2 ".csv")}' FS=, OFS=, $current_data
    else
    echo "You chose not to split the dataset, your cleaned data is under: $current_data"
fi