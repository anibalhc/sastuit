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


library(e1071)

## First specify the packages of interest
packages = c("e1071", "shinyBS")

## Now load or install&load all
package.check <- lapply(
  packages,
  FUN = function(x) {
    if (!require(x, character.only = TRUE)) {
      install.packages(x, dependencies = TRUE)
      library(x, character.only = TRUE)
    }
  }
)


