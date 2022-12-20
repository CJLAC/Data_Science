#Individual Project 1
#Instructions:
#Extract from twitter using your developer's credentials. Choose any keyword you want. 
#Get 10000 observations "excluding retweets.
#Plot the time series from the date created. with legends. 
#Plot a graph (any graph you want)  based on the type of device - found in Source - that the user use. Include the legends.
#Create a wordcloud from the screenName

  
  
install.packages('twitteR')
install.packages('rtweet')
install.packages("tm")
install.packages("tidytext")
install.packages("plotly")
install.packages("wordcloud")
install.packages("wordcloud2")
install.packages("RColorBrewer")
install.packages("magrittr")

library(twitteR)
library(rtweet)
library(tm)
library(dplyr)
library(plotly)
library(ggplot2)
library(RColorBrewer)
library(tidytext)
library(stringr)
library(tidyr)
library(magrittr)
library(wordcloud)
library(wordcloud2)

CONSUMER_KEY <- "lJc31mWVPXu9I7lPIBUWbBylI"
CONSUMER_KEY_SECRET <- "8o2yBbOzv1KlmKPbklXtR2gi5Csp5d92e3cgsgUwjw7EWY8YZh"
ACCESS_TOKEN <-"1595765589414641664-H5zVwdlBixAtRQEgxylvmCrHjQhvQz"
ACCESS_TOKEN_SECRET <- "DBgz0vzmH9CTzImiWicpuAHBuIhcTaDIGViide0hSVS9s"


setup_twitter_oauth(consumer_key = CONSUMER_KEY,
                    consumer_secret = CONSUMER_KEY_SECRET,
                    access_token = ACCESS_TOKEN,
                    access_secret = ACCESS_TOKEN_SECRET)

#Extract from twitter using your developer's credentials. Choose any keyword you want. 
#Get 10000 observations "excluding retweets.

TWTR <- searchTwitter("America -filter:retweets", 
                           n = 10000, 
                           lang = "en", 
                           since = "2022-12-8", 
                           until = "2022-12-15",
                           retryOnRateLimit = 120)
TWTR_DF <- twListToDF(TWTR)



TWTR_DF
save(TWTR_DF, file = "TWTR_DF.Rdata") 

TWTR_DF$text <- sapply(TWTR_DF$text,function(x) iconv(enc2utf8(x), sub="byte"))
TWTR_DF$text

head(TWTR_DF$text)
sapply(TWTR_DF, function(x) sum(is.na(x)))


trendsDF <- TWTR_DF %>%
  select(screenName,text,created,statusSource)
save(trendsDF, file = "TRENDS_DF.Rdata")  

#Plot the time series from the date created. with legends. 

trendsDF %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

trendsDF %<>% 
  mutate(Created_At_Round = created%>% 
           round(units = 'hours') %>% 
           as.POSIXct())

trendsDF %>% pull(created) %>% min()

trendsDF %>% pull(created) %>% max()

plt <- trendsDF %>% 
  dplyr::count(Created_At_Round) %>% 
  ggplot(mapping = aes(x = Created_At_Round, y = n)) +
  theme_light() +
  geom_line(aes(x = Created_At_Round, y = n, colour = "red") )+
  xlab(label = 'Date') +
  ylab(label = NULL) +
  ggtitle(label = "Number of Tweets per Hour")

plt %>% ggplotly()


#Plot a graph (any graph you want)  based on the type of device - found in Source 
#- that the user use. Include the legends.

encodeSource <- function(x) {
  if(grepl(">Twitter for iPhone</a>", x)){
    "iphone"
  }else if(grepl(">Twitter for iPad</a>", x)){
    "ipad"
  }else if(grepl(">Twitter for Android</a>", x)){
    "android"
  } else if(grepl(">Twitter Web Client</a>", x)){
    "Web"
  } else if(grepl(">Twitter for Windows Phone</a>", x)){
    "windows phone"
  }else if(grepl(">dlvr.it</a>", x)){
    "dlvr.it"
  }else if(grepl(">IFTTT</a>", x)){
    "ifttt"
  }else if(grepl(">Facebook</a>", x)){  .
    "facebook"
  }else {
    "others"
  }
}


trendsDF$tweetSource = sapply(trendsDF$statusSource, 
                              encodeSource)

tweet_appSource <- trendsDF %>% 
  select(tweetSource) %>%
  group_by(tweetSource) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 

deviceSource <- ggplot(trendsDF[trendsDF$tweetSource != 'others',], aes(tweetSource, fill = tweetSource)) +
  geom_bar() +
  theme(legend.position="none",
        axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylab("Number of tweets") +
  ggtitle("Tweets by Source")
deviceSource 


#Create a wordcloud from the screenName

tweet_appScreen <- trendsDF %>%
  select(screenName) %>%
  group_by(screenName) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 

namesCorpus <- Corpus(VectorSource(trendsDF$screenName))  
class(trendsDF$screenName)

library(wordcloud2)
wordcloud2(data=tweet_appScreen, 
           size=0.8, 
           color='random-dark',
           shape = 'pentagon')

