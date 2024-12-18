#How to run a frequency.

library(gssr)
devtools::install_github("kjhealy/gssrdoc")


library(gssrdoc)

data(gss_all)

?confed
confed_vector <- gss_all$confed
confed_freq_table <- table(confed_vector)
confed_freq_table

?sex
sex_vector <- gss_all$sex
sex_freq_table <- table(sex_vector)
sex_freq_table

?race
race_vector <- gss_all$race
race_freq_table <- table(race_vector)
race_freq_table

?age
age_vector <- gss_all$age
age_freq_table <- table(age_vector)
age_freq_table

?educ
educ_vector <- gss_all$educ
educ_freq_table <- table(educ_vector)
educ_freq_table

?income
income_vector <- gss_all$income
income_freq_table <- table(income_vector)
income_freq_table

?region
region_vector <- gss_all$region
region_freq_table <- table(region_vector)
region_freq_table

?polviews
polviews_vector <- gss_all$polviews
polviews_freq_table <- table(polviews_vector)
polviews_freq_table

?relig
relig_vector <- gss_all$relig
relig_freq_table <- table(relig_vector)
relig_freq_table
