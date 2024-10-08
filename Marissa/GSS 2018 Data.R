#Hi team, this is how you access GSS data in R.

#Install these two packages:
install.packages('gssr', repos =
                   c('https://kjhealy.r-universe.dev', 'https://cloud.r-project.org'))
install.packages('gssrdoc', repos =
                   c('https://kjhealy.r-universe.dev', 'https://cloud.r-project.org'))

#load the package gssr:
library(gssr)
gss18 <- gss_get_yr(2018)

#Check your data, you should have 2348 obs and 1069 variables. Let me know if you need any help!
gss18


