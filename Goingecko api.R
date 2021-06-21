library(tidyverse)
library(jsonlite)
library(httr)
library(rjson)
library(data.table)
library(dplyr)
library(janitor)
# Reference the dt.id for all the ID's that match with coinbase (later used for loop to pick each element)
dt.ico.api <- as.data.frame("zap")
df.coingecko.foundico.id <- as.data.frame(coingecko_foundico_match$id)

length(coingecko.id.list.unique$`unique(coingecko_foundico_match$id)`)

#Make all tickers full caps to match them

df.coingecko.foundico.id$`coingecko_foundico_match$id` <- make_clean_names(df.coingecko.foundico.id$`coingecko_foundico_match$id`, case=("snake"))

#Intersect table for tickers in 2017, 54 in total 
dt.match.ID.2017 <- as.data.table(intersect(df.coingecko.foundico.id$`coingecko_foundico_match$id`, df.tickers.2017$`data__main__|__-`))
setnames(dt.match.ID.2017, "V1", "ID")

x = 1
dt.match.ID.2017[1,]

for(i in 1:nrow(dt.match.ID.2017)) {       # for-loop over rows
  fff <- (dt.match.ID.2017[i,1])
  print(fff)
}

location <- data.frame(data.df[i,2],data.df[,3])
ex <- extract(s, location)

#Make a dt that one can pick the relevant start date (might need a function for unix converter)
# Goingecko takes earliest date available
# Gather all price data from earliest date, then cross reference with ICO Date and see day distance 
#distribution. 

dt.start.date <-as.data.frame(1483230902) 
dt.end.date <-as.data.frame(1609369200)


View(dt.2017.id.prices.final)
#Check the 3rd row in dt.final might be a mistake + ambrr is sus af
#Coin ID 16 not found, ID 18, 19, 25, 26, 34, 35, 36, 37, 39, 40, 41, 43, 
#THe snake lower case fucks it, cause - becomes _ 
# Have to create loop otherwise to tedious
# lot of coins have -2 or _2 after their name
length(unique(coingecko_foundico_match$id))
# 972 Unique ticker ID's. 

dt.match.ID.test <- as.data.frame(dt.match.ID.2017[1:5,])
ico.prices
ID <- dt.match.ID.2017[1,]


base.2
base.4 <- dt.start.date
base.6 <- dt.end.date
base.2 <- toString(ID)

base <- "https://api.coingecko.com/api/v3/coins/"
base.3 <- "/market_chart/range?vs_currency=usd&from="
base.5 <- "&to="

library(httr)
#1226 total list


##
#Have to check this out cause I fucked up
check.out.ids  
#I referenced 665:100 instead of 665:1000 what does that do?
#for example Helium coin is 771
#some coins seem to be missing such as microana they got skipped?
##

length(coingecko.id.list.unique$`unique(coingecko_foundico_match$id)`)



coingecko.id.100 <- as.data.frame(coingecko.id.list.unique$`unique(coingecko_foundico_match$id)`[925:972])
View(coingecko.id.100)

setnames(coingecko.id.100, "coingecko.id.list.unique$`unique(coingecko_foundico_match$id)`[925:972]", "ID")

View(coingecko.id.100)

for (i in coingecko.id.100$ID) {
    base.2 <- (i)
      id.api.call <- str_c(base, base.2, base.3, base.4, base.5, base.6, collapse = NULL)
        print(id.api.call)
      
        json.response <- GET(id.api.call)
 # Grab just the prices from the list into dataframe
 #json.response.text <- content(json.response, as = "text")

        json.response.parsed <- content(json.response, as = "parsed") 
        ico.prices <- json.response.parsed[c(1)]
        dt.ico.prices <- rbindlist(ico.prices)
        ico.prices
# Swich rows and columns
        dt.ico.prices.transposed <- as.data.table(t(dt.ico.prices))
        setnames(dt.ico.prices.transposed, "V1", base.2, skip_absent = TRUE)
        setnames(dt.ico.prices.transposed, "V2", base.2, skip_absent = TRUE)
        length(dt.ico.prices.transposed$Price)
        dt.ico.prices.all <- cbind(dt.ico.prices.all, dt.ico.prices.transposed)
  
}
View(dt.ico.prices.all)


write.xlsx(dt.ico.prices.all, 'ico.prices.19.03.21.xlsx')

#725 ID's 
ico.prices

id.api.call
json.response <- GET(id.api.call)
# Grab just the prices from the list into dataframe
#json.response.text <- content(json.response, as = "text")

json.response.parsed <- content(json.response, as = "parsed") 
ico.prices <- json.response.parsed[c(1)]
dt.ico.prices <- rbindlist(ico.prices)
ico.prices
# Swich rows and columns
dt.ico.prices.transposed <- as.data.table(t(dt.ico.prices))
setnames(dt.ico.prices.transposed, "f", "Aditus", skip_absent = TRUE)
setnames(dt.ico.prices.transposed, "V2", "Aditus", skip_absent = TRUE)
length(dt.ico.prices.transposed$Price)
dt.ico.prices.all <- cbind(dt.ico.prices.all, dt.ico.prices.transposed)




dt.ico.prices.all.tranposed <- as.data.frame((t(dt.ico.prices.all)))
View(dt.ico.prices.all.transposed)
dt.ico.prices.all.transposed<-tibble::rownames_to_column(dt.ico.prices.all.tranposed, "Name") 

write_xlsx(dt.ico.prices.all.transposed, "dt.ico.prices.all.transposed.xlsx")

length(intersect(dt.token.names.transposed$dt.token.names.transposed, dt.ico.prices.all.transposed$Name))
length(intersect(dt.ico.just.prices$names, dt.token.main.transposed$name))















View(dt.2017.id.prices.final)
json.response <- GET(id.api.call)



json_file <- "https://api.coingecko.com/api/v3/coins/list"
json_data <- fromJSON(paste(readLines(json_file), collapse=""))



#Getting complete list of ICOs

json.coingecko.list <- fromJSON("~/Downloads/response_1617650985960 (3).json")
json.coingecko.ico <- GET("https://api.coingecko.com/api/v3/coins/list")
json.coingecko.parsed <- content(json.coingecko.ico, as = "parsed") 
ico.list.full <- json.coingecko.parsed[c(1)]
dt.ico.list.full <- rbindlist(ico.list.full)
View(dt.ico.list.full)

id.api.call

rm(dt.2017.id.prices.final)  
dt.2017.id.prices.final.2 <- dt.2017.id.prices.final
View(dt.2017.id.prices.final)
price <- " price"
time <- " Unix time"

#dt.2017.id.prices.final <- dt.ico.prices.transposed
View(dt.final)
length(dt.2017.id.prices.final$`Unix time stamp`)






#Pick every 24th element, cause it provides price data every hour. 
dt.daily.price <- dt.test[seq(1, NROW(dt.test), by = 24),]
length(dt.daily.price$Price)


#######End of loop

#exportJSOn <- toJSON(json.response)
#write(json.response, "prices.json")





y <- "f" 
x <- "hello"
f <- str_c(y, x, collapse = NULL)
f

tickernames.id.match <- as.data.table(intersect(ticker_names$data__finance__purchase_unit, dt.ico$id))
tickernames.names.match <- as.data.table(intersect(ticker_names$data__finance__purchase_unit, dt.ico$name))
tickernames.symbol.match <- as.data.table(intersect(ticker_names$data__finance__purchase_unit, dt.ico$symbol))

merge.test <- merge(dt.ico, ticker_names, by.x = "symbol", by.y = "data__finance__purchase_unit")
dt.coingecko.symbol.caps <- as.data.table(make_clean_names(dt.ico$symbol, case = c("screaming_snake")))
dt.coingecko.name.caps <- as.data.table(make_clean_names(dt.ico$name, case = c("screaming_snake")))

dt.foundico.names.cap <- as.data.table(make_clean_names(FOUNDICO_names$`data__main__|__-`, case = c("screaming_snake")))

names.match.caps <- as.data.table(intersect(dt.foundico.names.cap$V1, dt.coingecko.name.caps$V1))

tickernames.symbol.match.caps <- as.data.table(intersect(dt.coingecko.symbol.caps$V1, ticker_names$data__finance__purchase_unit))
tickernames.name.match.caps <- as.data.table(intersect(dt.coingecko.name.caps$V1, ticker_names$data__finance__purchase_unit))

# Matches based on names: 358
# Matches based on Ticker : 868

dt.ico.2$symbol <- make_clean_names(dt.ico.2$symbol, case = c("screaming_snake"))
dt.ico.2$name <- make_clean_names(dt.ico.2$name, case = c("screaming_snake"))

dt.merged.symbol <- merge(tickernames.symbol.match.caps, dt.ico.2, by.x = "V1", by.y = "symbol")
# Final matched results for Symbol column 
dt.merged.name <- merge(names.match.caps, dt.ico.2, by.x = "V1", by.y = "name")

setnames(dt.merged.name, "V1", "name")
setnames(dt.merged.symbol, "V1", "symbol")
merged.coingecko.foundico <- rbind(dt.merged.name, dt.merged.symbol)

write_xlsx(merged.coingecko.foundico,"~/Users/m.v.b/Desktop/FOUNDICO_names.xlsx")

write.csv(merged.coingecko.foundico, "Coingecko_Foundico_matched.csv")
