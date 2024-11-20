# Joshua Gray

#Read in data frames and filter down to the variables we want
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

colnames(y18) <- c('year', 'id', 'sex', 'age', 'race', 'relig', 'educ', 'income', 'region', 'polviews', 'confed', 'pres16')
colnames(y21) <- c('year', 'id', 'sex', 'age', 'race', 'relig', 'educ', 'income', 'region', 'polviews', 'confed', 'pres16')
colnames(y22) <- c('year', 'id', 'sex', 'age', 'race', 'relig', 'educ', 'income', 'region', 'polviews', 'confed', 'pres16')



common_77_82 <- Reduce(intersect, list(colnames(y77), colnames(y78), colnames(y80), colnames(y82)))
common_18_22 <- Reduce(intersect, list(colnames(y18), colnames(y21), colnames(y22)))                      

gss77_82 <- rbind(y77[common_77_82], y78[common_77_82], y80[common_77_82], y82[common_77_82])

gss18_22 <- rbind(y18[common_18_22], y21[common_18_22], y22[common_18_22])

gss77_82$era <- ifelse(TRUE, 0, 1)
gss18_22$era <- ifelse(TRUE, 1, 0)

colnames(gss77_82) <- c('year', 'id', 'sex', 'age', 'race', 'relig', 'educ', 'income', 'region', 'polviews', 'confed', 'pres', 'era')
colnames(gss18_22) <- c('year', 'id', 'sex', 'age', 'race', 'relig', 'educ', 'income', 'region', 'polviews', 'confed', 'pres', 'era')

gss77_82$pres <- as.character(gss77_82$pres)
gss18_22$pres <- as.character(gss18_22$pres)

gss <- bind_rows(gss77_82, gss18_22)

gss$pres[gss$pres == 2] <- 0

gss <- gss[gss$polviews != 4,]
gss$polviews[gss$polviews == 1] <- 0
gss$polviews[gss$polviews == 2] <- 0
gss$polviews[gss$polviews == 3] <- 0
gss$polviews[gss$polviews == 5] <- 1
gss$polviews[gss$polviews == 6] <- 1
gss$polviews[gss$polviews == 7] <- 1

gss$confed[gss$confed == 1] <- 0
gss$confed[gss$confed == 2] <- 0
gss$confed[gss$confed == 3] <- 1

write.csv(gss, 'GSS_data.csv')