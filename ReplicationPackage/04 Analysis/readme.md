# Data analysis

These scripts can be used to prepare and statistically analyse the results from the experiments.

## Installation
RStudio version 2021.09.0+351 should be installed with R version 4.1.1.

The R packages plyr and ggplot2 need to be installed by running the following commands in RStudio.

```R
install.packages("ggplot2")
install.packages("plyr")
```

## Usage
clean_data.R can be used to remove duplicates and transform the raw data from 04 Data Processing to usable txt files.

GreenLab_statistics.R can be used to create figures and statistically analyse the collected data.