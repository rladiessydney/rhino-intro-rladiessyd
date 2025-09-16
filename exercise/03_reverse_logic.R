# app/logic/reverse.R

box::use(
  stringi[stri_reverse]
)

#' @export
reverse_words <- function(text) {
  stringi::stri_reverse(text)
}