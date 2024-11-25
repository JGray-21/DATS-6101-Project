# Joshua Gray

library(gssr)
library(gssrdoc)
library(dplyr)

#Read in data from each year
y77 <- gss_get_yr(1977)
y78 <- gss_get_yr(1978)
y80 <- gss_get_yr(1980)
y82 <- gss_get_yr(1982)

y18 <- gss_get_yr(2018)
y21 <- gss_get_yr(2021)
y22 <- gss_get_yr(2022)

#Filter variables
vars1 <- c('year', 'id', 'sex', 'age', 'race', 'relig', 'educ', 'income', 'region', 'polviews', 'confed', 'pres76')
vars2 <- c('year', 'id', 'sex', 'age', 'race', 'relig', 'educ', 'income16', 'region', 'polviews', 'confed', 'pres16')

y77 <- y77[, vars1]
y78 <- y78[, vars1]
y80 <- y80[, vars1]
y82 <- y82[, vars1]

y18 <- y18[, vars2]
y21 <- y21[, vars2]
y22 <- y22[, vars2]

#Reset column names for joining
colnames(y18) <- c('year', 'id', 'sex', 'age', 'race', 'relig', 'educ', 'income', 'region', 'polviews', 'confed', 'pres16')
colnames(y21) <- c('year', 'id', 'sex', 'age', 'race', 'relig', 'educ', 'income', 'region', 'polviews', 'confed', 'pres16')
colnames(y22) <- c('year', 'id', 'sex', 'age', 'race', 'relig', 'educ', 'income', 'region', 'polviews', 'confed', 'pres16')


#Combine each time interval
common_77_82 <- Reduce(intersect, list(colnames(y77), colnames(y78), colnames(y80), colnames(y82)))
common_18_22 <- Reduce(intersect, list(colnames(y18), colnames(y21), colnames(y22)))                      

gss77_82 <- rbind(y77[common_77_82], y78[common_77_82], y80[common_77_82], y82[common_77_82])
gss18_22 <- rbind(y18[common_18_22], y21[common_18_22], y22[common_18_22])

#Recode Income variable
gss77_82$income <- case_when(
  gss77_82$income == 1 ~ 'Low',
  gss77_82$income == 2 ~ 'Low',
  gss77_82$income == 3 ~ 'Low',
  gss77_82$income == 4 ~ 'Low',
  gss77_82$income == 5 ~ 'Low',
  gss77_82$income == 6 ~ 'Middle',
  gss77_82$income == 7 ~ 'Middle',
  gss77_82$income == 8 ~ 'Middle',
  gss77_82$income == 9 ~ 'Middle',
  gss77_82$income == 10 ~ 'Middle',
  gss77_82$income == 11 ~ 'High',
  gss77_82$income == 12 ~ 'High',
  TRUE ~ 'NA'
)


gss18_22$income <- case_when(
  gss18_22$income == 1 ~ 'Low',
  gss18_22$income == 2 ~ 'Low',
  gss18_22$income == 3 ~ 'Low',
  gss18_22$income == 4 ~ 'Low',
  gss18_22$income == 5 ~ 'Low',
  gss18_22$income == 6 ~ 'Low',
  gss18_22$income == 7 ~ 'Low',
  gss18_22$income == 8 ~ 'Low',
  gss18_22$income == 9 ~ 'Low',
  gss18_22$income == 10 ~ 'Low',
  gss18_22$income == 11 ~ 'Low',
  gss18_22$income == 12 ~ 'Low',
  gss18_22$income == 13 ~ 'Low',
  gss18_22$income == 14 ~ 'Low',
  gss18_22$income == 15 ~ 'Low',
  gss18_22$income == 16 ~ 'Middle',
  gss18_22$income == 17 ~ 'Middle',
  gss18_22$income == 18 ~ 'Middle',
  gss18_22$income == 19 ~ 'Middle',
  gss18_22$income == 20 ~ 'Middle',
  gss18_22$income == 21 ~ 'Middle',
  gss18_22$income == 22 ~ 'Middle',
  gss18_22$income == 23 ~ 'Middle',
  gss18_22$income == 24 ~ 'High',
  gss18_22$income == 25 ~ 'High',
  gss18_22$income == 26 ~ 'High',
  TRUE ~ 'NA'
)

#Create time interval variable for time analysis
gss77_82$era <- ifelse(TRUE, 0, 1)
gss18_22$era <- ifelse(TRUE, 1, 0)

#Reset column names for join
colnames(gss77_82) <- c('year', 'id', 'sex', 'age', 'race', 'relig', 'educ', 'income', 'region', 'polviews', 'confed', 'pres', 'era')
colnames(gss18_22) <- c('year', 'id', 'sex', 'age', 'race', 'relig', 'educ', 'income', 'region', 'polviews', 'confed', 'pres', 'era')

#Remove labels from pres variable
gss77_82$pres <- as.character(gss77_82$pres)
gss18_22$pres <- as.character(gss18_22$pres)

#Join the two time intervals together
gss <- bind_rows(gss77_82, gss18_22)

#Re-code pres variable to be 0 for Rep. candidate
gss$pres[gss$pres == 2] <- 0

#Re-code Polviews variable to be binomial
gss <- gss[gss$polviews != 4,]
gss$polviews[gss$polviews == 1] <- 1
gss$polviews[gss$polviews == 2] <- 1
gss$polviews[gss$polviews == 3] <- 1
gss$polviews[gss$polviews == 5] <- 0
gss$polviews[gss$polviews == 6] <- 0
gss$polviews[gss$polviews == 7] <- 0

#Recode confed variable to be binomial
gss$confed[gss$confed == 1] <- 1
gss$confed[gss$confed == 2] <- 1
gss$confed[gss$confed == 3] <- 0


#Create incumbency variable
gss$incumbency <- ifelse(gss$year == 1977, 1,
                       ifelse(gss$year == 1978, 1,
                              ifelse(gss$year == 1980, 1,
                                     ifelse(gss$year == 1982, 0,
                                            ifelse(gss$year == 2018, 0,
                                                   ifelse(gss$year == 2021, 1,
                                                          ifelse(gss$year == 2022, 1, NA)))))))


#write dataframe to csv file
write.csv(gss, 'GSS_data.csv')

ggplot(gss, aes(x=income)) + geom_histogram(stat="count") + labs(title = "Income Graph", x="Income")