* Backstory / motivation / context (Vaijayanti)
* The General Social Survey (GSS), conducted since 1972 is a crucial tool for understanding American society. Founded by James A. Davis, the GSS monitors trends in opinions, attitudes and behaviors across various topics such as social behaviour, political opinions, civil liberties, morality and social mobility. It includes a core set of demographic and behavioral questions, thus allowing comparisons for over nearly 80 years due to its consistent question set. The survey's rich data helped researchers, policymakers and scholars analyze societal changes, assess the impact of policies and compare trends with other nations. Researchers and policymakers use the GSS to track trends, assess the impact of social policies and explore correlations between different social factors. Its longitudinal nature allows for the examination of how attitudes and behaviors evolve over time thus providing valuable insights into the dynamics of American society.

* Main Questions and hypothesis(Josh)

We aim to use the GSS data set to answer the following questions: 
   How do people feel about our government? How has that changed since the 1970s? 
We plan to look at how different demographics feel about different aspects of our government and compare the answers to what they were in the 70's. Our goal is to find correlations between demographics and government sentiment. We also want to identify any trends as they appear throughout the years and investigate what might have caused any major shifts in sentiment.


* Data set info(Marissa)

For our analysis, we intend to use the cumulative, cross-sectional data from the General Social Survey (GSS) from 1972 to 2018. The GSS data collection is carried out by the National Opinion Research Center (NORC) at the University of Chicago to support social science research. Since 1972, the data has been gathered face-to-face. However, in recent years, researchers transitioned to telephone interviews for data collection. GSS data was collected annually from 1972 to 1994 (excluding 1979, 1981, and 1992), and since 1994, researchers now administer it every even-numbered year. From 1972 to 2018, GSS has been conducted using a simple random sample. Thus, our sample of 72,390 individuals is representative of the population.


---------------------------------------------------------------------------------------------------

* loctrust - 82
* fedtrust - 87
* poleff11-17 - 84
* corrupt1-2 - 06 and 16
* congovt - 91
* **confed - 73 - 84 and 86 - 22**


* sex
* race
* age
* educ
* income
* region 1972-2022
* polviews 1974-2022
* relig 1972-2022





---------------------------------------------------------------------------------------------------------

gss74 <- gss_get_yr(1974)
gss75 <- gss_get_yr(1975)
gss76 <- gss_get_yr(1976)
gss77 <- gss_get_yr(1977)
gss78 <- gss_get_yr(1978)
gss80 <- gss_get_yr(1980)

gss16 <- gss_get_yr(2016)
gss18 <- gss_get_yr(2018)
gss21 <- gss_get_yr(2021)
gss22 <- gss_get_yr(2022)


common_74_80 <- Reduce(intersect, list(colnames(gss74), colnames(gss75), colnames(gss76), colnames(gss77), colnames(gss78), colnames(gss80)))

common_16_22 <- Reduce(intersect, list(colnames(gss16), colnames(gss18), colnames(gss21), colnames(gss22)))                       
 
gss74_80 <- rbind(gss74 [common_74_80], gss75 [common_74_80], gss76 [common_74_80], gss77 [common_74_80], gss78 [common_74_80], gss80 [common_74_80])

gss16_22 <- rbind(gss16 [common_16_22], gss18 [common_16_22], gss21 [common_16_22], gss22 [common_16_22])


gss74_80

gss16_22


## To Do List

#### EDA / Summary
 * Data table shape (num rows and cols)
 * Mean, Median, Mode 
 * Variable Description
 * Distribution testing (Normal distribution or Not)
   * QQ Plots
 * Histograms

#### Variation
 * Variance and Standard Deviation

#### Hypothesis Testing
 * Chi Squared Test
 * Maybe T Test???
