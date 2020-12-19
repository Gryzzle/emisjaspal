#' Funkcja,ktora oblicza emisje spalania
#'
#'Funkcja oblicza dane ze zmiennej
#' \code{wskazniki}, oraz ze zmiennej \code{input}. Wynik przedstawiony jest w postaci ramka danych
#' zapisana w zmiennej \code{out}. Dane dowolnie filtrujemy z podzialem na
#'  euro standard, kategorie oraz zanieczyszczenie.
#'
#'
#' @param dane dataframe - dane wejscowe
#' @param kategoria character - kategoria pojazdu
#' @param euro character - norma dopuszczalna emisji spalin
#' @param zanieczyszczenie character - rodzaj zanieczyszczenia
#' @param mod character - tryb jazdy danego pojazdu
#'
#' @return dataframe
#'
#' @import dplyr tidyverse ggplot2
#' @examples
#' emisjadk(input, "Passenger Cars", "Euro 5", c("EC", "CO"),"")
#' emisjadk(input, "Passenger Cars", "Euro 4", , "")
#' emisjadk(input, "Passenger Cars", "Euro 3", "CO" , "")
#' @export

emisjadk <- function(dane = input,
                     kategoria = NULL,
                     euro = NULL,
                     zanieczyszczenie = NULL,
                     mod = "")
{

  out <- wskazniki

  if(!is.null(kategoria))
  {
    out <- out %>% filter(Category %in% kategoria)
  }
  else
  {
    uniq <- unique(out$Category)
    out <- out %>% filter(Category %in% uniq)
  }


  if(!is.null(euro))
  {
    out <- out %>% filter(EuroStandard %in% euro)
  }
  else
  {
    uniq <- unique(out$EuroStandard)
    out <- out %>% filter(EuroStandard %in% uniq)
  }

  if(!is.null(zanieczyszczenie))
  {
    out <- out %>% filter(Pollutant %in% zanieczyszczenie)
  }
  else
  {
    uniq <- unique(out$Pollutant)
    out <- out %>% filter(Pollutant %in% uniq)
  }


  out <- inner_join(x = out, y = input, by = c("Segment","Fuel","Technology"))

  out <- out %>%
    mutate(Emisja = Nat * ((Alpha * Procent ^ 2 + Beta * Procent + Gamma + (Delta/Procent))/
                             (Epsilon * Procent ^ 2 + Zita * Procent + Hta) * (1-Reduction))
    ) %>%
    select(Category, Fuel, EuroStandard, Technology, Pollutant, Mode, Segment, Nat, Emisja)

  out <<- out
  return(out)

}
