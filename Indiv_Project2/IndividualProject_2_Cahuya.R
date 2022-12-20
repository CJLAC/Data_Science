library(twitteR)
library(rtweet)
library(tm)
library(dplyr)
library(plotly)
library(ggplot2)
library(RColorBrewer)
library(tidytext)
library(tidyverse)
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

#Extract 10000 tweets from Twitter using twitteR package including retweets

RETWTS <- searchTwitteR("ludwig",
                        n = 10000, 
                        lang = "en", 
                        since = "2022-12-8", 
                        until = "2022-12-15",
                        retryOnRateLimit = 120)

RETWTS
RETWTSDF <- twListToDF(RETWTS)


# SAVE DATA
save(RETWTSDF,file = "RETWEETSDF.Rdata")

# LOAD DATA
load(file = "RETWEETSDF.Rdata")

# CHECK MISSING VALUES
sap_data <- sapply(RETWTSDF, function(x) sum(is.na(x)))
sap_data

#Tweets
# SUBSETTING USING THE dplyr() PACKAGE.
tweets <- RETWTSDF %>%
  select(screenName,text,created, isRetweet) %>% filter(isRetweet == FALSE)
tweets

# GROUPS THE DATA 
tweets %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

crt_data <- tweets %>%  mutate(Created_At_Round = created %>% round(units = 'hours') %>% as.POSIXct())
crt_data

mn <- tweets %>% pull(created) %>% min()
mn 
mx <- tweets %>% pull(created) %>% max()
mx

# Plot on tweets by time using the library(plotly) and ggplot().
data_plot <- ggplot(crt_data, aes(x = Created_At_Round)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "midnightblue", high = "aquamarine4")

data_plot %>% ggplotly()

#Retweets

sub_retwts <- RETWTSDF %>%
  select(screenName,text,created, isRetweet) %>% filter(isRetweet == TRUE)
sub_retwts

sub_retwts %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

crt2 <- sub_retwts %>%  mutate(Created_At_Round = created %>% round(units = 'hours') %>% as.POSIXct())
crt2

mn <- sub_retwts %>% pull(created) %>% min()
mn 
mx <- sub_retwts %>% pull(created) %>% max()
mx

# Plot on tweets by time using the library(plotly) and ggplot().
data_plot <- ggplot(crt2, aes(x = Created_At_Round)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "midnightblue", high = "aquamarine4")

data_plot %>% ggplotly()

