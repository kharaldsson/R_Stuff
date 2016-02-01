library(httr)

# 1. Find OAuth settings for twitter:
#    https://dev.twitter.com/docs/auth/oauth
oauth_endpoints("twitter")

# 2. Register an application at https://apps.twitter.com/
#    Make sure to set callback url to "http://127.0.0.1:1410"
#
#    Replace key and secret below
myapp <- oauth_app("twitter",key = "REMOVETHISCAPITALIZEDSTRINGTYrWFPkFAkn4G5BbkWINYw",secret = "REMOVETHISCAPITALIZEDSTRINGqjOkmKYU9kWfUFWmekJuu5tztE9aEfLbt26WlhZL8")

# 3. Get OAuth credentials
twitter_token <- oauth1.0_token(oauth_endpoints("twitter"), myapp)

# 4. Use API
req <- GET("https://api.twitter.com/1.1/statuses/home_timeline.json",config(token = twitter_token))
stop_for_status(req)
content(req)


#can also use this method
#clear 
rm(list=ls())

library(twitteR)
library(ROAuth)
library(RCurl)

options(httr_oauth_cache=T)
api_key <- "REMOVETHISCAPITALIZEDSTRINGIGgvbQIyj9kzEOxJ3QnwHUP7A"
api_secret <- "REMOVETHISCAPITALIZEDSTRINGnRR5r3svua7RGUwseGuKeJFyoo2I2MADPSRogQHEjd94ZIBoff"
access_token <- "REMOVETHISCAPITALIZEDSTRING1965566857-JP80nKuold7m1q1IA4K5iRve2ej1uwDuZQ6EZiw"
access_token_secret <- "REMOVETHISCAPITALIZEDSTRINGEO2crNYwATZESKwQptLCOeGEGyWESLzH0ZlIZfocp4xj9"

setup_twitter_oauth(api_key,api_secret)
