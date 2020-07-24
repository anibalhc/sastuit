#source("www/files/funciones.R")

# obtained number column text
number_column_text <- match("text",names(df_search_API))

# obtained number column location
number_column_location <- match("location",names(df_search_API))

# obtained number column profile_image_url
number_column_profile_image_url <- match("profile_image_url",names(df_search_API))

# obtained number column profile_banners
profile_banners <- match("profile_banners",names(df_search_API))

# obtained number column lang
number_column_lang <- match("lang",names(df_search_API))

if(!is.na(number_column_text)){
  
  
  mensaje_columText <<- FALSE
  
  #df_search_API <- data.frame(lapply(df_search_API, as.character), stringsAsFactors=FALSE)
  
  #Depurar tweets null
  df_search_Clean <- df_search_API %>% filter(text !="")
  df_search_Clean <- df_search_Clean %>% filter(text !=" ")
  
  #Depurar tweets duplicados.
  df_search_Clean <- df_search_Clean[!duplicated(df_search_Clean$text), ]


  if(!is.na(number_column_lang)){
    #Seleccionar tweets en el idioma seleccionado.
    df_search_Clean <- df_search_Clean %>% filter(lang == tweetsIdioma)
  }
  
  # preprocessing column text
  source("www/files/preprocessingText.R")
  
  # Depurar tweets duplicados.
  df_search_Clean <- df_search_Clean[!duplicated(df_search_Clean$text), ]
  #df_search_Clean <- distinct(df_search_Clean)
  
  if(!is.na(number_column_profile_image_url)){
    if(tweetsImgPerfil){
      df_search_Clean <- df_search_Clean %>% filter(profile_image_url !="")
      df_search_Clean <- df_search_Clean %>% filter(profile_image_url !=" ")
    }
  }
  if(!is.na(profile_banners)){
    if(tweetsImgPortada){
      df_search_Clean <- df_search_Clean %>% filter(profile_banners != "")
      df_search_Clean <- df_search_Clean %>% filter(profile_banners != " ")
    }
  }
  var_apply_top_location <<- FALSE
  if(!is.na(number_column_location)){
    
    if(tweetsUbicacionVacia){
      
      # select column location 
      select_location <- df_search_Clean$location
      #select_location_demo <- select_location
      
      
      if(tweetsIdioma == "en"){
        
        select_location <- trans_format_text(select_location,"latin1","ASCII")
        
        # apply function clean_trash
        df_search_Clean$location <- clean_trash(select_location)
        
      }else if(tweetsIdioma == "es"){
        
        if(var_lang_sent == TRUE){
          select_location <- trans_format_text(select_location,"UTF-8","ISO-8859-1")        
          }
        
        #View(select_location)
        # apply function clean_trash
        df_search_Clean$location <- clean_trash(select_location)
      }
      

      # apply function clean_trash
      #df_search_Clean$location <- clean_trash(df_search_Clean$location)
      
      # removing tweets with location nulls
      df_search_Clean <- df_search_Clean %>% filter(location !="")
      df_search_Clean <- df_search_Clean %>% filter(location !=" ")
      
      # create the text corpus
      corpus_location <- Corpus(VectorSource(df_search_Clean$location))
      
      # apply function clean_location
      corpus_location <- clean_location(corpus_location)
      
      # convert text to data.frame
      data_frame_location <- data.table(data.frame(corpus_location))
      
      # removing tildes
      data_frame_location[, text := stri_trans_general(str = text, 
                                         id = "Latin-ASCII")]
      
      # reemplaza la columna pre procesada
      df_search_Clean$location <- data_frame_location$text

      #-
      # removing tweets with location nulls
      df_search_Clean <- df_search_Clean %>% filter(location !="")
      df_search_Clean <- df_search_Clean %>% filter(location !=" ")
      
      # apply function replace_country
      df_search_Clean$location <- replace_country(df_search_Clean$location)
      
      var_apply_top_location <<- TRUE
      
    }
    
  }
  if(tweetsLongitud !=0){
    #Seleccionar tweets mayores a tweetsLongitud
    df_search_Clean <- df_search_Clean %>% filter(nchar(as.character(text))>tweetsLongitud)
  }
  
  
}else{
  mensaje_columText <<- TRUE
}

  

 