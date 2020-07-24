
# function clean_location
clean_location <- function(corpus){
  
  # conversion to lowercase
  corpus <- tm_map(corpus, content_transformer(tolower))

  # removing numbers
  corpus <- tm_map(corpus,removeNumbers)
  
  # removing punctuation
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[[:punct:]]', replacement = ' ')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[!]+', replacement = ' ')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[.]+', replacement = ' ')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[?]+', replacement = ' ')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[,]+', replacement = ' ')
  corpus <- tm_map(corpus, removePunctuation)
  
  # removing strip whitespace
  corpus <- tm_map(corpus, stripWhitespace)
  
  return(corpus)
}

# function clean_text_en to text english
clean_text_en <- function(corpus){
  
  # removing emails
  corpus <- tm_map(corpus, replace_email)
  
  # removing punctuation
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[[:punct:]]', replacement = '')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[,]+', replacement = '')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[@]+', replacement = ' ')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[#]+', replacement = ' ')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[™]+', replacement = ' ')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[’]+', replacement = "'")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[—]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[“]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[”]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[–]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[…]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[·]+', replacement = "")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[€]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[,]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[(]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[)]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[<]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[>]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[_]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[•]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[´]+', replacement = "'")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[°]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "[']+", replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "[£]+", replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "[…]+", replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "[”]+", replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "[•]+", replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "[‘]+", replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "[–]+", replacement = " ")
  corpus <- tm_map(corpus, removePunctuation)
  
  # removing numbers
  corpus <- tm_map(corpus, removeNumbers)
  
  # conversion to lowercase
  corpus <- tm_map(corpus, content_transformer(tolower))
  
  # removing stopwords
  corpus <- tm_map(corpus, removeWords, extras_stopwords)
  
  # stemming
  corpus <- tm_map(corpus, stemDocument)
  
  # removing strip whitespace
  corpus <- tm_map(corpus, stripWhitespace)
  
  return(corpus)
  
}

pre_clean_text_es <- function(corpus){
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[[:punct:]]', replacement = ' ')
  
  corpus <- tm_map(corpus, content_transformer(tolower))
  
}
# function clean_text_es to text spanish
clean_text_es <- function(corpus){
  
  # removing emails
  corpus <- tm_map(corpus, replace_email)
  
  #corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[^\x01-\x7F]', replacement = "")
  
  # removing punctuation
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[[:punct:]]', replacement = ' ')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[•]+', replacement = '')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[,]+', replacement = ' ')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[@]+', replacement = ' ')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[#]+', replacement = ' ')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[™]+', replacement = ' ')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[’]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[—]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[“]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[”]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[–]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[…]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[·]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[€]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[,]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[(]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[)]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[<]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[>]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[_]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[•]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[´]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[°]+', replacement = "  ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "[']+", replacement = "")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "[£]+", replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "[…]+", replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "[”]+", replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "[•]+", replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "[‘]+", replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "[–]+", replacement = " ")
  corpus <- tm_map(corpus, removePunctuation)
  
  # removing numbers
  corpus <- tm_map(corpus, removeNumbers)
  
  # conversion to lowecase
  corpus <- tm_map(corpus, content_transformer(tolower))
  
  # removing stopwords
  corpus <- tm_map(corpus, removeWords, extras_stopwords)
  
  corpus <- tm_map(corpus, stemDocument, language="spanish")
  
  # removing strip whitespace
  #corpus <- tm_map(corpus, stripWhitespace)
  
  return(corpus)
}

# function clean_text_es_SinStemDocument to text spanish
clean_text_es_SinStemDocument <- function(corpus){
  
  # removing emails
  corpus <- tm_map(corpus, replace_email)
  
  # removing punctuation
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[[:punct:]]', replacement = ' ')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[,]+', replacement = ' ')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[@]+', replacement = ' ')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[#]+', replacement = ' ')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[™]+', replacement = ' ')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[’]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[—]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[“]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[”]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[–]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[…]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[·]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[€]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[,]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[(]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[)]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[<]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[>]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[_]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[•]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[´]+', replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[°]+', replacement = "  ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "[']+", replacement = "")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "[£]+", replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "[…]+", replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "[”]+", replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "[•]+", replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "[‘]+", replacement = " ")
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = "[–]+", replacement = " ")
  corpus <- tm_map(corpus, removePunctuation)
  
  # removing numbers
  corpus <- tm_map(corpus, removeNumbers)
  
  # conversion to lowecase
  corpus <- tm_map(corpus, content_transformer(tolower))
  
  # removing stopwords
  corpus <- tm_map(corpus, removeWords, extras_stopwords)
  
  #corpus <- tm_map(corpus, stemDocument, language="spanish")
  
  # removing strip whitespace
  corpus <- tm_map(corpus, stripWhitespace)
  
  return(corpus)
}

clean_trash <- function(texto_){
  
  #texto_ <- iconv(texto_, "latin1", "UTF-8", sub="")
  #texto_ <- iconv(texto_, "UTF-8", "ISO-8859-1", sub="")
  
  # remove special characters to text
  trash <- c("http","<U","#","&amp","@")
  
  i <- 1
  continue <- TRUE
  while(continue) {
    v <- trash[i]
    v <- paste(v,'\\S+\\s*',sep = "")
    texto_ <-  str_trim(gsub(v," ", texto_))
    i <- i + 1
    if(i > length(trash)){
      continue <- FALSE
    }
  }
  
  texto_ <- trim(texto_)
  
  return(texto_)
  
}

#remove repeated vocals
remove_repeated_characters <- function(texto_){
  texto_ <- gsub('([aeiou]{1})\\1+', '\\1', texto_)
  #vocals and consonants
  #texto_ <- gsub('([[:alpha:]])\\1+', '\\1', texto_)
}

# function transformt format text

trans_format_text <- function(t_text,from,to){
  
  t_text <- iconv(t_text, from, to, sub="")
  
  return(t_text)
}

# function replace_country: 
# Reemplazar nombre de localizacion por su similar: ejemplo: Estados Unidos -> usa
replace_country <- function(c_text){
  
  nrow_ <- nrow(as.data.frame(c_text))
  
  i <- 1
  
  continue <- TRUE
  
  while(continue){
    
    texto <- as.character(trim(c_text[i]))
    
    if (is.na(texto)) {
      i = i + 1
    }
    else if(str_detect(texto,"australian") || str_detect(texto,"australia")){
      c_text[i] <- "australian"
      i = i + 1
    }
    else if(str_detect(texto,"peru")){
      c_text[i] <- "peru"
      i = i + 1
    }
    else if(str_detect(texto,"ecuador")){
      c_text[i] <- "ecuador"
      i = i + 1
    }
    else if (str_detect(texto, "colombia") || texto == "medellin col" || texto == "santiago de cali cucuta bogota"
             || str_detect(texto, "santiago de cali")) {
      c_text[i] <- "colombia"
      i = i + 1
    } 
    else if (str_detect(texto, "mexico") || str_detect(texto, "oaxaca") || str_detect(texto, "cdmx") || str_detect(texto, "merida yucatan")
             || str_detect(texto, "mty mx")  || str_detect(texto, "monterrey nuevo leon") || str_detect(texto, "queretaro qro")
             || str_detect(texto, "amecameca edo mex") || str_detect(texto, "san miguel de allende guanaju")
             || str_detect(texto, "saltillo coahuila") || str_detect(texto, "culiacan sinaloa")|| str_detect(texto, "montertey nuevo leon") ){
      c_text[i] <- "mexico"
      i = i + 1
    }   
    else if (str_detect(texto, "chile") || texto == "metropolitana de santiago chi") {
      c_text[i] <- "chile"
      i = i + 1
    }  
    else if (str_detect(texto, "alajuela costa rica")) {
      c_text[i] <- "costa rica"
      i = i + 1
    } 
    else if (str_detect(texto, "montevideo") || str_detect(texto, "montevideo uruguay")) {
      c_text[i] <- "uruguay"
      i = i + 1
    } 
    else if (str_detect(texto, "venezuela") || texto == "caracas venezuela") {
      c_text[i] <- "venezuela"
      i = i + 1
    }
    else if (str_detect(texto, "india") || texto == "new delhi" || texto == "hyderabad india" || texto == "pune india" || 
             texto == "chennai india" || texto == "mumbai india" || texto == "new delhi india" || 
             texto == "noida india" || texto == "new delhi delhi" || texto =="ahmadabad city india" || 
             texto == "ahmedabad" || texto == "ahmedabad gujarat" || texto == "amravati india"
             || texto == "bengaluru india" || texto =="jalandhar india" || texto == "gurgaon india" ||
             texto == "delhi india"){
      c_text[i] <- "india"
      i = i + 1
    }
    else if (str_detect(texto, "enland") || str_detect(texto, "england") || texto == "united kingdom" || texto == "london uk" || texto == "london united kingdom" || 
             texto == "london england" || texto == "london" || texto == "london enland"
             || texto == "united kindom" || texto == "uk" || texto == "manchester enland"|| texto == "england united kingdom"||
             texto == "sheffield" || texto == "hertfordshire" || texto == "south east england" ||
             texto == "cambridge england" || texto == "manchester england" || texto == "hull england"){
      c_text[i] <- "england"
      i = i + 1
    }
    else if (str_detect(texto, "usa") || str_detect(texto, "miami") || str_detect(texto, "new york united states") || str_detect(texto,"centennial") || str_detect(texto, "texas") || 
             str_detect(texto,"silicon valley") || str_detect(texto,"san diego ca") || texto == "united states" || texto == "new york ny" || texto == "carol stream il" || 
             texto == "boston ma" || texto == "bremerton wa " || texto == "los angeles ca" || texto == "chicago il" || 
             texto == "new york usa" || texto == "washington dc" || texto == "denver co" || 
             texto == "new york" || texto == "seattle wa" || texto == "sickerville nj" ||
             texto == "new york city" || texto == "houston tx" || texto == "california usa" ||
             texto == "los angeles" || texto == "minnesota usa" || texto == "miami fl" 
             || texto == "arizona usa" || texto == "charlotte harbor fl " || texto == "seattle usa"
             || texto == "las vegas nv" || texto == "ohio usa" || texto == "santa clara ca"
             || texto == "michigan usa" || texto == "silicon valley" || texto == "georgia usa"
             || texto == "pennsylvania usa" || texto == "boston" || texto == "texas" || texto == "texas usa"
             || texto == "massachusetts usa" || texto == "charlotte harbor fl" || texto == "brooklyn ny"
             || texto == "michigan" || texto == "virginia usa" || texto == "charlotte nc" 
             || texto == "denver" || texto == "kansas city mo" || texto == "manhattan ny" || texto == "chicago"
             || texto == "estados unidos" || texto == "usa"  || texto == "new york ny usa"
             || texto == "new york new york" || texto == "new york london" || texto == "new york city ny"
             || texto == "new york city new york" || texto == "new york chicago" || texto == "new york london"
             || texto == "anaheim ca" || texto == "arlington va" || texto == "arlington virginia"
             || texto == "austin tx" || texto == "austintx" || texto == "boston massachusetts" || texto == "boston ma usa"
             || texto == "bothell wa usa" || texto == "brattleboro vt usa" || texto == "carol stream il"
             || texto == "washinton dc" || texto == "san francisco" || texto == "sw michian usa" || texto == "usa"
             || texto == "san francisco ca" || texto == "san dieo ca" || texto == "atlanta ga" || texto == "san francisco nyc"
             || texto == "san jose ca" || texto == "san diego ca" || texto == "dallas tx" || texto == "florida usa"
             || texto == "new jersey usa" || texto == "san diego" || texto == "san diego california"
             || texto == "wisconsin" || texto == "dallas tx usa"|| texto == "official ericsson us canada" || texto =="washington dc area" ||
             texto == "sw michigan usa" || texto == "eu" || texto =="newton mass usa" || texto == "san jose ca usa" ||
             texto == as.character('united states of') || texto == "united states of america" || texto == "alameda ca" ||
             texto == "silicon valley ca" || texto == "chatsworth ca"  || texto == "naples fl" ) { 
      
      c_text[i] <- "usa" 
      i = i + 1
    }
    else if (str_detect(texto, "france") || texto == "marseille france" || texto == "paris france" || texto == "france" || texto == "paris"
             || texto == "iledefrance france" || texto == "toulouse france" || texto == "berreletang france"
             || texto == "france" || texto == "massy france") {
      c_text[i] <- "france" 
      
      i = i + 1
    }
    else if(str_detect(texto, "bali") || str_detect(texto, "indonesia") || texto == "seminyak bali"){
      c_text[i] <- "indonesia"
      i = i + 1
    }
    else if(str_detect(texto, "japan") || texto == "tokyoto japan" || texto == "tokyo japan" || texto == "japon" || texto == "japan"
            || texto == "osaka japan"){
      c_text[i] <- "japan"
      i = i + 1
    }
    else if(str_detect(texto, "china") || texto == "shenzhen china" || texto == "beijin china" || texto == "bejin china"
            || texto == "shanhai china" || texto =="beijing china" || texto == "bejing china"){
      c_text[i] <- "china"
      i = i + 1
    }
    else if(str_detect(texto, "espana") || str_detect(texto, "spain") || str_detect(texto, "madrid") || str_detect(texto, "espana") || str_detect(texto, "barcelona")  
            || str_detect(texto, "gibraltar") || texto == "barcelona espana" || texto == "madrid spain" || texto == "sevilla espana" || texto == "valencia"
            || texto == "barcelona spain" || texto == "valencia espana" || texto == "andalucia"
            || texto == "espana" || texto == "madrid espana" || texto == "madrid comunidad de madrid" ||
            texto == "barcelona catalonia"){
      c_text[i] <- "spain"
      i = i + 1
    }
    else if(str_detect(texto, "canada") || str_detect(texto, "vancouver") || texto == "toronto on" || texto == "toronto ontario" || texto == "toronto canada"
            || texto == "montreal quebec" || texto == "vancouver bc" || texto == "toronto"
            || texto == "canada bc kelowna" || texto == "canada vancouver" || texto == "canada"
            || texto == "ontario canada"|| texto == "greater vancouver" || texto == "ottawa canada"
    ){
      c_text[i] <- "canada"
      i = i + 1
    }
    else if(str_detect(texto, "malaysia") || texto == "malaysia" || texto == "singapore"){
      c_text[i] <- "malaysia"
      i = i + 1
    }
    else if(str_detect(texto, "ireland")){
      c_text[i] <- "ireland"
      i = i + 1
    }
    else if(str_detect(texto, "brasil") || str_detect(texto, "brazil") || texto == "sao paulo" || texto == "sao paulo brasil" || texto == "sao paulo brazil" || 
            texto == "brazil" || texto == "brasilia brasil" || texto == "betim brasil" 
            || texto == "brasilia brazil" || texto == "brasilia df" || texto == "rio de janeiro brasil"){
      c_text[i] <- "brazil"
      i = i + 1
    }
    else if(str_detect(texto, "turkiye") || texto == "istanbul turkiye" || texto == "türkiye" ){
      c_text[i] <- "turkey"
      i = i + 1
    }
    else if(str_detect(texto, "italy") ||str_detect(texto, "italia world") || texto == "genova italy" || texto == "italy" || texto == "treviso italy"
            || texto == "italia" || texto == "rome italy"){
      c_text[i] <- "italy"
      i = i + 1
    }
    else if(str_detect(texto, "germany") || texto == "g funkturm" || texto == "italy" || texto == "treviso italy"
            || texto == "hambur germany" || texto == "goettingen germany" || texto == "goettingen germany"
            || texto == "berlin germany" || texto == "berlin deutschland" || texto == "oldenburg" || texto =="hamburg"){
      c_text[i] <- "germany"
      i = i + 1
    }
    else if(str_detect(texto, "sweden") || texto == "stockholm sverie" || texto == "stockholm sweden" || texto == "berlin" || texto =="stockholm sverige"){
      c_text[i] <- "sweden"
      i = i + 1
    }
    else if(str_detect(texto, "finland") || texto == "helsinki finland" || texto == "espoo finland" ){
      c_text[i] <- "finland"
      i = i + 1
    }
    else if(str_detect(texto, "tokyo") || texto == "mostly in tokyo"){
      c_text[i] <- "tokyo"
      i = i + 1
    }
    else if(str_detect(texto, "nigeria") || texto == "lagosnigeria" || texto == "lagos nigeria"){
      c_text[i] <- "nigeria"
      i = i + 1
    }
    else if(str_detect(texto, "thailand") || texto == "bangkok thailand"){
      c_text[i] <- "thailand"
      i = i + 1
    }
    else if(str_detect(texto, "netherlands") || texto == "the netherlands" || texto == "amsterdam"){
      c_text[i] <- "netherlands"
      i = i + 1
    }
    else if(str_detect(texto, "belgium") || texto == "brussels belgium"){
      c_text[i] <- "belgium"
      i = i + 1
    }
    else if(str_detect(texto, "argentina") || texto == "ushuaia argentina" || texto == "buenos aires argentina"
      || texto == "ciudad autonoma de buenos aire"){
      c_text[i] <- "argentina"
      i = i + 1
    }
    else if( texto == "android" || texto == "algun lugar de la tierra" || texto == "info" || texto == "worldwide" || texto == "global" || texto == "everywhere" || texto == "tere picheufufufuf"
             || texto == "deutschland"|| texto == "earth"|| texto == "o sea"|| texto == "internet" || texto == "tu corazon"
             || texto == "ai" || texto == "seg"|| texto == "betacaryophyllene" || texto == "iii everywhere"
             || texto == "pregunten lo que quieran" || texto == "en los labios de mi nina" || texto == "aqui en mi pais"
             || texto == "yo que se en cuarentena" || texto == "wherever he is" || texto == "detras de ti"
             || texto == "en libertad" || texto == "en tu corazon bb" || texto == "she her" || texto == "infiernopasevip"
             || texto == "la concha de tu puta madre" || texto == "internacional" || texto == "informate comparte y actua"
             || texto == "todo el mundo" || texto == "your heart" || texto == "ya has leido mi nuevo libro"
             || texto == "ya has leido mi nuevo libro"){
      c_text[i] <- "otros"
      i = i + 1
    }
    else{
      i = i + 1
    }
    if(i > nrow_){
      continue <- FALSE
    }
    
  }
  
  return(c_text)
}

#stem_snowball(c("queremos", "patatas", "comimos", "amó","ganó","papá"), "es")

clean_hashtags <- function(corpus){
  # removing punctuation
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[[:punct:]]', replacement = '')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[!]+', replacement = '')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[.]+', replacement = '')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[?]+', replacement = '')
  corpus <- tm_map(corpus, content_transformer(gsub), pattern = '[,]+', replacement = '')
  corpus <- tm_map(corpus, removePunctuation)
  corpus <- tm_map(corpus, content_transformer(tolower))
  return(corpus)
}

