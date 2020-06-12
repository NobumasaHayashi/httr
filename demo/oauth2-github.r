library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
  key = "e85436aacf33b40d9046",
  secret = "ab4bd30c4fbb227bbea722373e90f271caf3cd0e"
)

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
##req <- GET("https://api.github.com/rate_limit", gtoken)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

# OR:
##req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
req <- with_config(gtoken, GET("https://api.github.com/users/jtleek/repos"))
stop_for_status(req)
content(req)
