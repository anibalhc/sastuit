# libraries

# install.packages("tm")
# install.packages("SnowballC")
# install.packages("readr")
# install.packages("dplyr")
# install.packages("shinythemes")
# install.packages("shinydashboard")
# install.packages("rtweet")
# install.packages("data.table")
# install.packages(DT)
# install.packages("stringi")

#install.packages("sweetalertR")

#install.packages("shinyBS")

library(shiny)
library(rtweet)
library("shinydashboard")
library("data.table")
library("shinythemes")
library(DT)

library(shinyBS)

#Text mining packages
library(tm)
library(SnowballC)
library(readr)
library(dplyr)
library(stringi)
library(textclean)
library(stringr)


#library(caTools)

#alert
library(shinyWidgets)


library("shinyjs")

#trim
library("gdata")

library(qdap)

library(tableHTML)


#install.packages(setdiff(c("e1071"), rownames(installed.packages())))

# Function to Install and Load R Packages
Install_And_Load <- function(Required_Packages)
{
    Remaining_Packages <- Required_Packages[!(Required_Packages %in% installed.packages()[,"Package"])];

    if(length(Remaining_Packages)) 
    {
        install.packages(Remaining_Packages);
    }
    for(package_name in Required_Packages)
    {
        library(package_name,character.only=TRUE,quietly=TRUE);
    }
}

# Specify the list of required packages to be installed and load    
Required_Packages=c("e1071");

# Call the Function
Install_And_Load(Required_Packages);
