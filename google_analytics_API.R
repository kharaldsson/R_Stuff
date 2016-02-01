require(RGoogleAnalytics)

client_id <- "REMOVETHISCAPITALIZEDTEXT420995166094-6oju1f4a9jlhic82lpbmh1p7bvmr0t81.apps.googleusercontent.com"
client_secret <- "REMOVETHISCAPITALIZEDTEXTDnjAfHm2Yy1oc_co528AEjsc"

#generate oauth_toekn object
oauth_token <- Auth(client_id, client_secret)

#save the token object for future sessions
save(oauth_token, file="oauth_token")
