# Functions for the Masterthesis

#colorfunction

colorize <- function(x, color) {
  if (knitr::is_latex_output()) {
    sprintf("\\textcolor{%s}{%s}", color, x)
  } else if (knitr::is_html_output()) {
    sprintf("<span style='color: %s;'>%s</span>", color,
            x)
  } else x
}


newline <- function(x) {
  if (knitr::is_latex_output()) {
    sprintf("\\linebreak", x)
  } else if (knitr::is_html_output()) {
    sprintf("<br>",
            x)
  } else x
}
