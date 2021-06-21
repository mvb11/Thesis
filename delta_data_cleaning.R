View(dt.ico.prices.all)

copy.dt.ico.prices.all <- dt.ico.prices.all
copy.dt.prices.all <- dt.prices.all
#Prices for the specific days

dt.prices.all <- dt.ico.prices.all[(nrow(dt.ico.prices.all)) %% 1 == 0, seq_len(ncol(dt.ico.prices.all)) %% 2 == 0]
dt.prices.1st.day <- dt.ico.prices.all[1, seq_len(ncol(dt.ico.prices.all)) %% 2 == 0]
dt.prices.30th.day <- dt.ico.prices.all[30, seq_len(ncol(dt.ico.prices.all)) %% 2 == 0]
dt.prices.90th.day <- dt.ico.prices.all[90, seq_len(ncol(dt.ico.prices.all)) %% 2 == 0]
dt.prices.365th.day <- dt.ico.prices.all[365, seq_len(ncol(dt.ico.prices.all)) %% 2 == 0]

# Would be interesting to find whats the optimal holding duration in days. Calculate which day has the most positive % since day 1 across dataset

# defining a function which calculates percent change

delta <- function(x){
  n <- nrow(copy.dt.prices.all)
  copy.dt.prices.all$Change <- c(NA,diff(copy.dt.prices.all$abulaba) / head(copy.dt.prices.all$abulaba,n-1))
  copy.dt.prices.all
}

sapply(copy.dt.prices.all, FUN = delta())

do.call(rbind, by(copy.dt.prices.all,copy.dt.prices.all$abulaba, FUN=delta))

# applying it over the data frame by `Firm` type

copy.dt.prices.all[delta := (nrow(copy.dt.prices.all)-(nrow(copy.dt.prices.all)-1))/nrow(copy.dt.prices.all), ]



install.packages("xlsx")
library(xlsx)

write.xlsx(dt.prices.all, 'ico.just.prices.xlsx')


View(dt.prices.1st.day)
View(dt.prices.all)


