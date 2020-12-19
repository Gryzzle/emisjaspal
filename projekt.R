library(devtools)
library(tidyverse)

use_r("emisjadk")

#dokumentacja

document()

#spradzenie

?emisjadk()

# 1. Wczytanie wskazników ------------------------------------------------

nazwa <- "C:/emisja_spal_R/emisjaspal/daneemisja.xlsx"

wskazniki <- openxlsx::read.xlsx(xlsxFile = nazwa,
                                 sheet = 2)

wskazniki$Mode[is.na(wskazniki$Mode)] <- ""

wskazniki <- wskazniki %>%
  select(-`EF.[g/km].or.ECF.[MJ/km]`,
         -`Min.Speed.[km/h]`,
         -`Max.Speed.[km/h]`,
         -Road.Slope,
         -Load)

colnames(wskazniki)[15:17] <- c("Reduction", "Bio", "Procent")

# 2. Przygotowanie danych wejściowych -------------------------------------

segm = c("Mini","Small","Medium","Large-SUV-Executive")
n_spl = 50

input <- data.frame(Nat = abs(rnorm(n_spl, mean = n_spl*2, sd = n_spl)),
                    Segment = sample(segm,
                                     size = n_spl,replace = T) %>% as.character(),
                    Fuel = sample(unique(wskazniki$Fuel),
                                  size = n_spl, replace = T) %>% as.character(),
                    Technology = sample(unique(wskazniki$Technology),
                                        size = n_spl, replace = T) %>% as.character())

save(input,file="Data/input.rda")
save(wskazniki,file="Data/wskazniki.rda")


load_all()

emisjadk(input, "Passenger Cars", "Euro 5", c("EC", "CO"),"")
emisjadk(input, "Passenger Cars", "Euro 3", "CO" , "")

view(wskazniki)
view(input)


