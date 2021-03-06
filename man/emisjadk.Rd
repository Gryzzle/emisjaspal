% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/emisjadk.R
\name{emisjadk}
\alias{emisjadk}
\title{Funkcja,ktora oblicza emisje spalania}
\usage{
emisjadk(
  dane = input,
  kategoria = NULL,
  euro = NULL,
  zanieczyszczenie = NULL,
  mod = ""
)
}
\arguments{
\item{dane}{dataframe - dane wejscowe}

\item{kategoria}{character - kategoria pojazdu}

\item{euro}{character - norma dopuszczalna emisji spalin}

\item{zanieczyszczenie}{character - rodzaj zanieczyszczenia}

\item{mod}{character - tryb jazdy danego pojazdu}
}
\value{
dataframe
}
\description{
Funkcja oblicza dane ze zmiennej
\code{wskazniki}, oraz ze zmiennej \code{input}. Wynik przedstawiony jest w postaci ramka danych
zapisana w zmiennej \code{out}. Dane dowolnie filtrujemy z podzialem na
euro standard, kategorie oraz zanieczyszczenie.
}
\examples{
emisjadk(input, "Passenger Cars", "Euro 5", c("EC", "CO"),"")
emisjadk(input, "Passenger Cars", "Euro 4", , "")
emisjadk(input, "Passenger Cars", "Euro 3", "CO" , "")
}
