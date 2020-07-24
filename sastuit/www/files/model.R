
# var_bandera_clean_text -> found in preprocessingText file
# valida si se realizo la limpieza a la columna text

if(exists('var_bandera_clean_text')){
  
  if(tweetsIdioma == "en"){
    
    tSparse_Modelo <- read.csv("www/files/files_csv/modelo/en/tSparse_Modelo.csv",header = TRUE, sep = ",",encoding = "Windows-1252")
     
    #load model train
    load(file = "www/files/files_csv/modelo/en/model.rda")
    
  }else if(tweetsIdioma == "es"){
    
    tSparse_Modelo <- read.csv("www/files/files_csv/modelo/es/tSparse_Modelo_nb.csv",header = TRUE, sep = ",",encoding = "Windows-1252")
    
    #load model train
    load(file = "www/files/files_csv/modelo/es/model_NB.rda")
    
  }

  # Create the Text Corpus
  corpus_descarga = Corpus(VectorSource(df_search_Clean$text))
  
  # Create Document Term Matrix
  # 'select_text' found in preprocessingText file
  frequencies_descarga = DocumentTermMatrix(corpus_descarga)
  
  sparse_descarga = removeSparseTerms(frequencies_descarga, 0.996)
  
  tSparse_descarga = as.data.frame(as.matrix(sparse_descarga))
  
  # se crea una matriz con ceros con el mismo número de filas de 'df_search_Clean' y columnas de tSparse_Modelo 
  new_matrix <- matrix(0, nrow(tSparse_descarga), ncol(tSparse_Modelo))
  
  # se agrega nombres
  colnames(new_matrix) <- names(tSparse_Modelo)
  
  # proceso para verificar que palabras existen de los tweets descargados en el modelo ya entrenado.
  i <- 1
  contador <- 1
  condition_1 <- TRUE
  condition_2 <- TRUE
  
  while(condition_1){
    
    # true/ false: mayores a 1 -> TRUE
    true_false <- as.data.frame(tSparse_descarga[i,]>=1)
    
    # seleccionar solo TRUE
    select_true <- true_false[which(true_false == TRUE)]
    
    # si no existe valores TRUE, pasa a la siguiente fila
    if(dim(select_true)[2]== 0){
      i <- i + 1
      condition_2 <- FALSE
    }
    
    while (condition_2) {
      
      # obtener el nombre de la columna
      name_colum <- names(select_true[contador])
      
      # obtener el numero de columna para verificar si hacen match con la bolsa de palabras del modelo IA
      num_colum <- match(name_colum, names(tSparse_Modelo))
      
      
      # verificar si existe en la bolsa de palabras del modelo
      if(!is.na(num_colum)){
        # se agrega el valor a la nueva matrix
        new_matrix [i,num_colum] <- tSparse_descarga[i,match(name_colum, names(tSparse_descarga))]
        contador <- contador + 1
      }else{
        contador <- contador + 1
      }
      # verifica si ya recorrio todas las palabras de select_true
      if(contador >= ncol(select_true) ){
        i <- i + 1
        contador <- 1
        condition_2 <- FALSE
      }
      
    }
    condition_2 <- TRUE
    
    if(i >= nrow(tSparse_descarga) ){
      condition_1 <- FALSE
    }
  }
  new_matrix <- data.frame(new_matrix)
  
  # Predicting on new_matrix set
  predValid_ <- predict(model_NB, new_matrix)
  
  #View(predValid_)
  
  new_matrix$sentiment <- predValid_
  


  
  if(var_lang_sent == TRUE){
    demo <- merge(df_search_API,df_search_Clean ,by='status_id',all.x = F , all.y = T)
  }
  else if(var_lang_CombinaFiles == TRUE){
    demo <- merge(df_search_API,df_search_Clean ,by='id',all.x = F , all.y = T)
  }

  
  # add prediction
  demo$sentiment <- predValid_
  #
  
  
  resultados <- table(predValid_)
  
  tw_negatives <- resultados[1]
  tw_positives <- resultados[2]

  table_results <<-  data.frame(t(data.table(c(nrow(df_search_Clean),tw_positives,tw_negatives))))
 
   # change idioman of titles
  setattr(table_results, 'names', c('Tweets',title_positive,title_negative))
  
  
  #location freq
  if(var_apply_top_location){
    
      #Obtener columna location
      select_location <- data.frame(df_search_Clean$location)
      colnames(select_location)[1]<-"location"
      
      #Filtar datos con location vacias.
      select_location <- select_location %>% filter(location !="")
      select_location <- select_location %>% filter(location !=" ")

      #Tabla de frecuencia location
      tabla_freq_location <- select_location %>% 
        count(location)  %>% 
        arrange(desc(n)) 

      total <- sum(tabla_freq_location$n)
      
      tabla_freq_location$porcentage <- round(tabla_freq_location$n * 100 / total,2)
      
      #tabla_location <<-  tabla_freq_location %>% select(1, 3)
      tabla_location <<-  tabla_freq_location

    }

  # obtained number column hashtags
  number_column_hashtag <- match("hashtags",names(df_search_Clean))
  
  contains_hashtags <<- FALSE
  if(!is.na(number_column_hashtag)){
    if(tweetshashtags_f){
      
      contains_hashtags <<- TRUE
      
      if(var_lang_sent == TRUE){
        hashtags <- data.frame(unlist(df_search_Clean$hashtags))
        names(hashtags) <- "hashtag"
        hashtags <- hashtags$hashtag

        hashtags <- trans_format_text(hashtags,"latin1","ISO-8859-1")
        hashtags <- data.table(hashtags)
        
        # removing tildes
        hashtags[, hashtags := stri_trans_general(str = hashtags, id = "Latin-ASCII")]
        #Columna hashtags
        hashtags <- Corpus(VectorSource(hashtags$hashtag))
      }
      else if(var_lang_CombinaFiles == TRUE){
        hashtags <- df_search_Clean$hashtags
        hashtags <- trans_format_text(hashtags,"latin1","ISO-8859-1")
        
        hashtags <- data.table(hashtags)
        
        # removing tildes
        hashtags[, hashtags := stri_trans_general(str = hashtags, id = "Latin-ASCII")]
        
        hashtags <- Corpus(VectorSource(hashtags))
        
      }

      hashtags <- clean_hashtags(hashtags)
      #Generar tabla de freq
      dtm <- TermDocumentMatrix(hashtags)
      m <- as.matrix(dtm)
      v <- sort(rowSums(m),decreasing = TRUE)
      
      tabla_hashtag <<- data.frame(word = names(v),freq = v)
      
      row.names(tabla_hashtag) <- NULL
      
      }else{
      contains_hashtags <<- FALSE
    }

  }
  
}
