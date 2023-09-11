#!/bin/bash

# Define an array of data
data=(
    "Sat Aug 28 14:23:53 EDT 2021,28756489,74582825,500500,776361"
    "Sun Sep 5 15:30:45 EDT 2021,28872591,75564321,502200,778992"
    "Fri Sep 17 12:45:12 EDT 2021,29120476,76523915,505250,783209"
    "Wed Oct 6 09:10:37 EDT 2021,29768014,78814239,511015,791806"
    "Sun Nov 14 11:55:21 EST 2021,30512367,81095001,520100,801345"
    "Fri Dec 31 18:20:05 EST 2021,31269502,82517645,532220,811720"
)

# Loop through the data and print it
for entry in "${data[@]}"; do
    IFS=',' read -r -a fields <<< "$entry"
    date="${fields[0]}"
    positive_cases="${fields[1]}"
    negative_tests="${fields[2]}"
    deaths="${fields[3]}"
    hospitalized="${fields[4]}"
    
    echo "On $date, there were $positive_cases positive cases, $negative_tests negative tests, $deaths deaths, and $hospitalized hospitalized."
done
