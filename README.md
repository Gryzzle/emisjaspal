# emisjaspal

`emisjaspal` Sluzy do obliczania emisji zanieczyszczen generowanych przez pojazdy.
Plik zrodlowy nazywa się `` 1.A.3.b.i-iv Road Transport Appendix 4 Emission Factors 2019.xlsx``.
Plik zostal wstepnie przerobiony i zapisany do zmiennych ``input`` oraz ``wskazniki``.
W pakiecie zastosowano funkcje.
Funkcja ``emisjadk()`` oblicza emisje zanieczyszczeń powietrza .
Funkcja ``wykresdk()`` rysuje wykres emisji zanieczyszczeń powietrza.

# Jak zainstalowac?

W pierwszej kolejnosci nalezy wczytac pakiety.

```r

library("tidyverse")
library("devtools")
library("dplyr")
library("car")

```

Następnie instalujemy pakiet z GitHuba

```r

install_github("https://github.com/Gryzzle/emisjaspal", force = T, build_vignettes = T)

```

# Przyklady uzycia

Dla funkcji ``emisjadk()``

```r
emisjadk(input, "Passenger Cars", "Euro 5", c("EC", "CO"),"")
emisjadk(input, "Passenger Cars", "Euro 4", , "")
emisjadk(input, "Passenger Cars", "Euro 3", "CO" , "")
```

Dla funkcji ``wykresdk()``

```r
wykresdk(out, "Pollutant")
wykresdk(out, "Technology")
wykresdk(out, "EuroStandard")
```

# Przeglad winiety

W celu lepszego zapoznania sie z pakietem nalezy uzyc ponizszej funkcji:

```r
browseVignettes("emisjaspal")
```
