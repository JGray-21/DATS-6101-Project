#How to run a frequency 

library(gssr)

data(gss_all)

sex_vector <- gss_all$sex
sex_freq_table <- table(sex_vector)
sex_freq_table
