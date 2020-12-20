#' Funkcja,ktora tworzy wykres na podstawie obliczonych emisji spalania
#'
#' Funkcja tworzy wykres na podstawie danych wynikowych z funkcji \code{emisjadk()}.
#' Danymi wejsciowymi jest ramka danych \code{out} oraz parametr \code{filtr} ,dzieki ktorym
#' wybieramy kolumne kategorii np. Pollutant, Technology, Euro Standard.
#'
#' @param dane dataframe - dane wynikowe z funkcji emisjadk()
#' @param filtr character - filtr kolumny kategorii
#'
#' @return
#' @import dplyr tidyverse car
#'
#' @examples
#' 1. wykresdk(out, "Pollutant")
#' 2. wykresdk(out, "Technology")
#' 3. wykresdk(out, "EuroStandard")
#' @export
wykresdk <-function(dane = out,
                   filtr = "Pollutant")
{
  if(filtr=="Pollutant"){
  ggplot(out, aes(x=Emisja, y=Nat, shape=Pollutant, color=Pollutant, size=Pollutant)) +
    geom_point() -> p
  }

  if(filtr=="Technology"){
    out <- na.omit(out)
    ggplot(out, aes(x=Emisja, y=Nat, shape=Technology, color=Technology, size=Technology)) +
      geom_point() -> p
  }

  if(filtr=="EuroStandard"){
    ggplot(out, aes(x=Emisja, y=Nat, shape=EuroStandard, color=EuroStandard, size=EuroStandard)) +
      geom_point() -> p
  }

  return(p)
}





