# select column text 
select_text <- df_search_Clean$text

if(tweetsIdioma == "en"){
  
  select_text <- trans_format_text(select_text,"latin1","ASCII")
  
  # apply function clean_trash
  select_text <- clean_trash(select_text)
  
}else if(tweetsIdioma == "es"){
  
  if(var_lang_sent == TRUE){
    select_text <- trans_format_text(select_text,"UTF-8","ISO-8859-1")
  }
  else if(var_lang_CombinaFiles == TRUE){
    select_text <- trans_format_text(select_text,"latin1","ISO-8859-1")
  }

  # apply function clean_trash
  select_text <- clean_trash(select_text)
  
  # it converts to corpus 
  select_text <- Corpus(VectorSource(select_text))
  
  #function pre_clean_text_es is applied
  select_text <- data.frame(pre_clean_text_es(select_text))

  # select column text 
  select_text <- select_text$text
  
  # replace words
  words <- c("sad","happy","application","app","k","q",'xq',"xk","facu","nunk","tediario","d","sr","grax","mms","jajajaja","jajaja","coronavirus","pndejo","beis","fut","presidentucho","pndja","please","hdspm","email","pendejito","asquito","chaspm","bye","report","qhdp","ahshsjs","prro","poquito","pq","uni","bro","brother","post","hdlgp","mams","miarda","dr","basic","tqm","the best","jajajajajajaja","xque","brothers","mail","profile","si","no","ne")
  words2 <- c("triste","feliz","aplicacion","aplicacion","que","que",'porque',"porque","faculdad","nunca","telediario","de","senor","gracias","mames","jaja","jaja","covid","pendejo","beisbol","futbol","presidente","pendeja","porfavor","hdp","correo","pendejo","asco","hdp","adios","reporte","hdp","hdp","perro","poco","porque","universidad","hermano","hermano","publicacion","hdp","mames","mierda","doctor","basico","te quiero mucho","el mejor","jaja","porque","hermanos","correo","perfil","yes","not","not")
  continue2 <- TRUE
  rowTweet <- 1
  while(continue2){
    
    continue <- TRUE
    
    texto_ <- select_text[rowTweet]
    #split in text un quotes " "
    texto_ <- strsplit(texto_, ' ')[[1]]
    i <- 1
    while(continue) {
      # replace words to original
      texto_[texto_==words[i]] <- words2[i]
      
      i <- i + 1
      if(i > length(words)){
        # convert text to vector
        texto_ <- paste(texto_, collapse = ' ')
        # reemplaze result
        select_text[rowTweet] <- texto_
        rowTweet <- rowTweet + 1
        continue <- FALSE
      }
      
    }
    if(rowTweet>length(select_text)){
      continue2 <- FALSE
    }
  }
  # apply function clean_trash
  select_text <- remove_repeated_characters(select_text)
}

select_text <- data.table(select_text)

# removing tildes
select_text[, select_text := stri_trans_general(str = select_text, id = "Latin-ASCII")]

#save variable select_text
select_text2_ <- select_text

# it converts to corpus 
select_text <- Corpus(VectorSource(select_text$select_text))

# it converts to corpus  select_text2_
select_text2_ <- Corpus(VectorSource(select_text2_$select_text))

if(tweetsIdioma == "en"){
  
  #function clean_text_en is applied
  select_text <- clean_text_en(select_text)
  

  
}else if(tweetsIdioma == "es"){
  
  #function clean_text_es is applied
  select_text <- clean_text_es(select_text)
  #function clean_text_es_SinStemDocument is applied
  select_text2_ <- clean_text_es_SinStemDocument(select_text2_)
}


# reemplaza la columna pre procesada
df_search_Clean$text <- as.data.frame(select_text)$text
# remove spaces
df_search_Clean$text<-str_trim(df_search_Clean$text)
#Depurar tweets null
df_search_Clean <- df_search_Clean %>% filter(text !="")
df_search_Clean <- df_search_Clean %>% filter(text !=" ")



#bandera
var_bandera_clean_text <<- TRUE