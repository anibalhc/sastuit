data_clean <-
  read.table(
    "www/files/files_csv/dataset_clean.csv",
    header = TRUE,
    sep = ",",
    check.names = TRUE,
    encoding = "Windows-1252"
  )

# Create the Text Corpus
corpus_descarga = Corpus(VectorSource(data_clean$text))

# Create Document Term Matrix
frequencies_descarga = DocumentTermMatrix(corpus_descarga)

sparse_descarga = removeSparseTerms(frequencies_descarga, 0.996)

tSparse_descarga = as.data.frame(as.matrix(sparse_descarga))

#save_as_csv(tSparse_descarga, "tSparse_descarga.csv", prepend_ids = T, na = "",
#            fileEncoding = "Windows-1252")

tSparse_descarga$sentiment <- data_clean$sentiment

table(tSparse_descarga$sentiment)

###########
set.seed(100)

tSparse_descarga_negativos <- tSparse_descarga[tSparse_descarga$sentiment == 'negative', ] 

train <- sample(nrow(tSparse_descarga_negativos), 0.8*nrow(tSparse_descarga_negativos), replace = FALSE)

TrainSet_negativos <- tSparse_descarga_negativos[train,]
ValidSet_negativos <- tSparse_descarga_negativos[-train,]

####
set.seed(100)

tSparse_descarga_positives <- tSparse_descarga[tSparse_descarga$sentiment == 'positive', ] 

train <- sample(nrow(tSparse_descarga_positives), 0.8*nrow(tSparse_descarga_positives), replace = FALSE)

TrainSet_positivos <- tSparse_descarga_positives[train,]
ValidSet_positivos <- tSparse_descarga_positives[-train,]

#bind
TrainSet_tweets <- rbind(TrainSet_negativos,TrainSet_positivos)
ValidSet_tweets <- rbind(ValidSet_negativos,ValidSet_positivos)


#save
save_as_csv(TrainSet_tweets, "TrainSet_tweets.csv", prepend_ids = FALSE, na = "",
            fileEncoding = "Windows-1252")

save_as_csv(ValidSet_tweets, "ValidSet_tweets.csv", prepend_ids = FALSE, na = "",
            fileEncoding = "Windows-1252")


# python was used to obtain results...

# ---------------------------------------------------------------------------------------

# Train model Naive Bayes

library(e1071)

set.seed(1234)

# convert to as.factor the column sentiment
# sastuit\www\files\files_csv\modelo\es\tSparse_Modelo_nb.csv

tSparse_Modelo$sentiment = as.factor(tSparse_Modelo$sentiment)


# model NB
model_NB <- naiveBayes(sentiment ~., data = tSparse_Modelo)

# predict
predValid_ <- predict(model_NB, new_matrix)

# save model
save(model_NB, file = "model_NB.rda")

