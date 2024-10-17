library(gssr)
years <- c(1972, 1973, 1974, 1975, 1976, 1977, 1978, 1980, 1982, 1983, 1984, 1985, 
           1986, 1987, 1988, 1989, 1990, 1991, 1993, 1994, 1996, 1998, 2000, 2002, 
           2004, 2006, 2008, 2010, 2012, 2014, 2016, 2018)
vars <- c()

names

for(x in years) {
  temp <- gss_get_yr(x)
  vars <- c(vars, colnames(temp))
}

df <- as.data.frame(table(vars))

# Use table() to get the frequency table
table<-table(df)

# Create Frequency Table with Proportions
prob_table <- table / sum(table)	 
print(prob_table)



