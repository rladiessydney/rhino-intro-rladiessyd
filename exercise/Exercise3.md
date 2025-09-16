# Exercise 3 - Logic and View

## Step 1 Reverse the word! - logic



- Copy the following syntax and create your `app/logic/reverse.R`
- `/exercise/03_reverse_logic.R`

```r
#| echo: true
#| eval: false

# app/logic/reverse.R

box::use(
  stringi[stri_reverse]
)

#' @export
reverse_words <- function(text) {
  stringi::stri_reverse(text)
}

```



## Step2

- Update your `app/view/hello.R`
- Refer to `/exercise/03_reverse.R`
- call the function

```r

box::use(
  app/logic/reverse[reverse_words]
)

```

- Add new output with reversed name in UI

- Update the Server


