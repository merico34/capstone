################################################################
################################################################
################### Loading the data frames ####################
################################################################
################################################################

df1  <- read.csv("AMECO1.TXT", header = TRUE, sep = ';')  # Population and Employment
df2  <- read.csv("AMECO2.TXT", header = TRUE, sep = ';')  # Consumption
df3  <- read.csv("AMECO3.TXT", header = TRUE, sep = ';')  # Capital Formation and Saving, Total Economy And Sectors
df4  <- read.csv("AMECO4.TXT", header = TRUE, sep = ';')  # Domestic and Final Demand
df5  <- read.csv("AMECO5.TXT", header = TRUE, sep = ';')  # National Income
df6  <- read.csv("AMECO6.TXT", header = TRUE, sep = ';')  # Domestic Product
df7  <- read.csv("AMECO7.TXT", header = TRUE, sep = ';')  # Gross Domestic Product (Income Approach), Labour Costs
df8  <- read.csv("AMECO8.TXT", header = TRUE, sep = ';')  # Capital Stock
df9  <- read.csv("AMECO9.TXT", header = TRUE, sep = ';')  # Exports and Imports of Goods And Services, National Accounts
df10 <- read.csv("AMECO10.TXT", header = TRUE, sep = ';') # Balances with the Rest Of The World, National Accounts
df11 <- read.csv("AMECO11.TXT", header = TRUE, sep = ';') # Foreign Trade
df12 <- read.csv("AMECO12.TXT", header = TRUE, sep = ';') # National Accounts by Branch Of Activity
df13 <- read.csv("AMECO13.TXT", header = TRUE, sep = ';') # Monetary Variables
df14 <- read.csv("AMECO14.TXT", header = TRUE, sep = ';') # Corporations (S11 + S12)
df15 <- read.csv("AMECO15.TXT", header = TRUE, sep = ';') # Households and Npish (S14 + S15)
df16 <- read.csv("AMECO16.TXT", header = TRUE, sep = ';') # General Government (S13)
df17 <- read.csv("AMECO17.TXT", header = TRUE, sep = ';') # Cyclical Adjustment of Public Finance Variables
df18 <- read.csv("AMECO18.TXT", header = TRUE, sep = ';') # Gross Public Debt

write.csv(df1 , file = "AMECO1.csv")
write.csv(df2 , file = "AMECO2.csv")
write.csv(df3 , file = "AMECO3.csv")
write.csv(df4 , file = "AMECO4.csv")
write.csv(df5 , file = "AMECO5.csv")
write.csv(df6 , file = "AMECO6.csv")
write.csv(df7 , file = "AMECO7.csv")
write.csv(df8 , file = "AMECO8.csv")
write.csv(df9 , file = "AMECO9.csv")
write.csv(df10, file = "AMECO10.csv")
write.csv(df11, file = "AMECO11.csv")
write.csv(df12, file = "AMECO12.csv")
write.csv(df13, file = "AMECO13.csv")
write.csv(df14, file = "AMECO14.csv")
write.csv(df15, file = "AMECO15.csv")
write.csv(df16, file = "AMECO16.csv")
write.csv(df17, file = "AMECO17.csv")
write.csv(df18, file = "AMECO18.csv")

# Rbind tables
df_all <- rbind(df1,
                df2,
                df3,
                df4,
                df5,
                df6,
                df7,
                df8,
                df9,
                df10,
                df11,
                df12,
                df13,
                df14,
                df15,
                df16,
                df17,
                df18)
library(dplyr)

# create list of EU countries
countries  = c('Austria', 'Belgium', 'Bulgaria','Cyprus','Croatia','Czech Republic','Denmark',
               'Estonia' ,'Finland' ,'France' ,'Germany' ,'West Germany' ,
               'Greece' ,'Hungary','Ireland' ,'Italy' ,'Latvia' ,'Lithuania','Luxembourg' 
               ,'Malta' ,'Netherlands' ,'Portugal' ,'Poland' ,'Romania' ,'Slovenia', 
               'Spain','Slovakia' ,'Sweden' ,'United Kingdom')

# filter df_all by EU countries
df_all <- df_all[df_all$COUNTRY %in% countries, ]

# create list of features selected
features = c('Total population ', 'Population: 0 to 14 years ',  'Population: 15 to 64 years ',  'Population: 65 years and over ',  'Civilian employment, persons (national) ',  'Unemployment rate: total :- Member States: definition EUROSTAT ',  'Private final consumption expenditure at current prices ',  'Price deflator private final consumption expenditure ',  'Private final consumption expenditure at current prices per head of population ',  'Collective consumption of general government at current prices ',  'Total consumption at current prices ',  'Gross fixed capital formation at current prices: total economy ',  'Consumption of fixed capital at current prices: total economy ',  'Gross capital formation at current prices: total economy ',  'Gross national saving ',  'Domestic demand excluding stocks at current prices ',  'Final demand at current prices ',  'Gross national income at current prices ',  'Gross national income at current prices per head of population ',  'Gross national disposable income ',  'National disposable income ',  'Gross domestic product at current prices ',  'Gross domestic product at current prices per hour worked ',  'Total annual hours worked: total economy ',  'Domestic income at current prices ',  'Compensation of employees: total economy ',  'Taxes linked to imports and production: total economy ',  'Subsidies: total economy ',  'Gross operating surplus: total economy ',  'Net operating surplus: total economy ',  'Nominal compensation per employee: total economy ',  'Net capital stock at 2010 prices: total economy ',  'Net returns on net capital stock: total economy ',  'Total factor productivity: total economy ',  'Exports of goods and services at current prices (National accounts) ',  'Imports of goods and services at current prices (National accounts) ',  'Exports of goods at current prices (National accounts) ',  'Exports of services at current prices (National accounts) ',  'Imports of goods at current prices (National accounts) ',  'Imports of services at current prices (National accounts) ',  'Terms of trade goods and services (National accounts) ',  'Net exports of goods and services at current prices (National accounts) ',  'Net primary income from the rest of the world (National accounts) ',  'Balance on current transactions with the rest of the world (National accounts) ',  'Net lending (+) or net borrowing (-): total economy ',  'Current account balance, Balance of payments statistics (BPM6) :- Partner: world ',  'Total exports of goods :- Foreign trade statistics ',  'Total imports of goods :- Foreign trade statistics ',  'ECU-EUR exchange rates (annual averages) :- Units of national currency per EUR/ECU ',  'Conversion rates between euro and former euro-zone national currencies ',  'Nominal short-term interest rates ',  'Nominal long-term interest rates ',  'Yield curve ',  'Current taxes on income and wealth: corporations ',  'Gross disposable income, corporations ',  'Net disposable income, corporations ',  'Gross saving: corporations ',  'Net saving: corporations ',  'Net lending (+) or net borrowing (-): corporations ',  'Net saving: households ',  'Current tax burden: total economy :- ESA 2010 ',  'Net saving: general government :- ESA 2010 ',  'Net lending (+) or net borrowing (-): general government :- ESA 2010 ',  'General government consolidated gross debt :- Excessive deficit procedure (based on ESA 2010) ')

# filter df_all by 64 features
df_all <- df_all[df_all$TITLE %in% features, ]

#########################################################
# Attempt 1 to identify common features among all countries (DO NOT USE)
#########################################################

# examine number of distinct features in each country; determined that Germany's features would be used since it has the least number
test <- df_all %>% group_by(COUNTRY) %>% summarise(count = n_distinct(TITLE))

# identify the subset of features missing in Germany; validate features discarded are not important
ger_features <- (df_all %>% filter(COUNTRY=='Germany') %>% group_by(TITLE) %>% summarize(count = n()))[,1]
leftover_features_ger <- features[!(features %in% ger_features$TITLE)]

# discarded features
# [1] "Price deflator private final consumption expenditure "                              
# [2] "Net returns on net capital stock: total economy "                                   
# [3] "Total factor productivity: total economy "                                          
# [4] "Terms of trade goods and services (National accounts) "                             
# [5] "ECU-EUR exchange rates (annual averages) :- Units of national currency per EUR/ECU "
# [6] "Conversion rates between euro and former euro-zone national currencies "

# filter all countries by Germany's features
df_all <- df_all %>% filter(TITLE %in% ger_features$TITLE)

# re-examine number of features for each country
test <- df_all %>% group_by(COUNTRY) %>% summarise(count = n_distinct(TITLE))

# identify the subset of features missing in Germany; validate features discarded are not important
rom_features <- (df_all %>% filter(COUNTRY=='Romania') %>% group_by(TITLE) %>% summarize(count = n()))[,1]
leftover_features_rom <- ger_features$TITLE[!(ger_features$TITLE %in% rom_features$TITLE)]

# discarded features
# [1] Civilian employment, persons (national) 

#filter all countries by Romania's features
test <- df_all %>% filter(TITLE %in% rom_features$TITLE)

# re-examine number of features for each country
test <- df_all %>% group_by(COUNTRY) %>% summarise(count = n_distinct(TITLE))

#########################################################
# Attempt 2 to identify common features among all countries
#########################################################

# identify number of countries for each feature
country_by_title <- df_all %>% group_by(TITLE) %>% summarize(count= n_distinct(COUNTRY))

# we learned that Malta has 10 features missing. 
#We decided to remove Malta from the analysis because it is a small country
# We considered using a similar-sized country to impute Malta's missing values, however
# Luxumbourg, the country closest to Malta's size, while similar population, GDP was 5x Malta's


# remove Malta from df_all 
df_all <- df_all %>% filter(COUNTRY != 'Malta')

# re-identify number of countries for each feature
country_by_title <- df_all %>% group_by(TITLE) %>% summarize(count= n_distinct(COUNTRY))

# find the Titles with 28 countries
country_by_title <- df_all %>% group_by(TITLE) %>% summarize(count= n_distinct(COUNTRY)) %>% filter(count ==28)

# filter df_all by 52 titles with all the countries
df_all <- df_all %>% filter(TITLE %in% country_by_title$TITLE)

# re-identify number of countries for each feature
country_by_title <- df_all %>% group_by(TITLE) %>% summarize(count= n_distinct(COUNTRY))

#########################################################
# Select 1 unit per title
#########################################################

# create unique sets of units (this excludes the following features:
# Taxes linked to imports and production: total economy,
# Subsidies: total economy,
# Gross operating surplus: total economy,
# Net operating surplus: total economy)
units <- c('1000 persons', 
           '(Percentage of active population) ', 
           'Mrd ECU/EUR',
           '(1000 EUR) ',
           '(millions) ',
           '(Mrd EUR) ',
           '(%) ')

# creating temp data frames 
temp_1 <- df_all %>% filter(UNIT %in% units)

temp_2 <- df_all %>% filter(TITLE %in% c("Taxes linked to imports and production: total economy ",
                                       "Subsidies: total economy ",
                                       "Gross operating surplus: total economy ",
                                       "Net operating surplus: total economy ",
                                       "Gross domestic product at current prices per hour worked "))
# combine temps into df_all
df_all <- rbind(temp_1, temp_2)

# confirm there are 28 countries for each feature (Germany and West Germany are still separate)
test <- df_all %>% group_by(TITLE) %>% summarize(count= n())

# clean features with more than one units
df_all <- df_all[!((df_all$TITLE == 'Gross domestic product at current prices per hour worked ') &
                 (df_all$UNIT == '(PPS: EU-15 = 100) ')),]

df_all <- df_all[!((df_all$TITLE == 'Gross domestic product at current prices per hour worked ') &
                   (df_all$UNIT == '(PPS: EU-28 = 100) ')),]

# re-confirm there are 28 countries for each feature (Germany and West Germany are still separate)
test <- df_all %>% group_by(TITLE) %>% summarize(count= n())

################################################
# Calculate Growth Rates (Feature Engineering) #
################################################

# calculate growth rates
table1 = matrix(ncol=dim(df_all)[2]-1-6, nrow=dim(df_all)[1])

for (i in (1:dim(df_all)[1])) {
  for (j in (6:dim(df_all)[2]-1)){
    table1[i,j-6] <- (df_all[i,j]/df_all[i,j-1]-1)
  }
} 




library(tidyr)

df1_tidy <- gather(df1, key="year", value="value", 6:65)
df1_tidy1 <- spread(df1_tidy, key=TITLE, value="value")
