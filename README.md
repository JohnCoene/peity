[![Build Status](https://travis-ci.org/JohnCoene/peity.svg?branch=master)](https://travis-ci.org/JohnCoene/peity)
[![saythanks](https://img.shields.io/badge/say-thanks-ff69b4.svg)](https://saythanks.io/to/JohnCoene)

# peity

[Peity](http://benpickles.github.io/peity/) htmlwidget for R.

> Peity (sounds like deity) is a jQuery plugin that converts an element's content into a <svg> mini pie  donut  line or bar chart  and is compatible with any browser that supports <svg>: Chrome, Firefox, IE9+, Opera, Safari.

## Install

```R
devtools::install_github("JohnCoene/peity")
```

## Basics

```R
library(peity)

peity("1/5", type = "pie")
peity(c(1,5), type = "donut", options = list(fill = I(c("green", "red")), radius = 100))
peity(c(1,5), type = "donut", options = list(fill = c("#845422", "#ead61c"), radius = 50, innerRadius = 40))
peity(rnorm(50, 2, 1), type = "line", options = list(width = 100))
peity(c(1,5,3), type = "bar", options = list(fill = I("green")))
```

## Rmarkdown

Use in rmarkdown in-line like so ``r peity(c(1,4,2), type = "pie")``, or in blocks like so

```R
```{r}
peity(c(1,4,2), type = "pie")
```
```

-----------------------------------------------

* Peity `3.2.1`
* jquery `3.1.1`

-----------------------------------------------

See [my other projects](http://johncoene.github.io/projects/)
