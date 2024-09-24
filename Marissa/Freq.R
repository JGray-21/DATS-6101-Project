#How to run a frequency.

library(gssr)
remotes::install_github("kjhealy/gssrdoc")
install.packages('gssrdoc', repos =
                   c('https://kjhealy.r-universe.dev', 'https://cloud.r-project.org'))

install.packages('gssr', repos =
                   c('https://kjhealy.r-universe.dev', 'https://cloud.r-project.org'))

library(gssrdoc)
data("gss_sub")
data("gss_dict")

data(gss_all)

?sex
sex_vector <- gss_all$sex
sex_freq_table <- table(sex_vector)
sex_freq_table

?loctrust
loctrust_vector <- gss_all$loctrust
loctrust_freq_table <- table(loctrust_vector)
loctrust_freq_table

?fedtrust
fedtrust_vector <- gss_all
