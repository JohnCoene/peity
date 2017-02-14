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

# pass options as list
peity(c(1,5), type = "donut", options = list(fill = I(c("green", "red")), radius = 100))
peity(c(1,5), type = "donut", options = list(fill = c("#845422", "#ead61c"), radius = 50, innerRadius = 40))
peity(rnorm(50, 2, 1), type = "line", options = list(width = 100))
peity(c(1,5,3), type = "bar", options = list(fill = I("green")))
```

## Set colors dynamically

```R
peity(c(4,-2,3, -4), type = "bar", options = list(fill = htmlwidgets::JS('function(value) {
    return value > 0 ? "green" : "red"
}')))
  
js_fun <- htmlwidgets::JS('function(_, i, all) {
    var g = parseInt((i / all.length) * 255)
    return "rgb(255, " + g + ", 0)"
}')

peity(c(0,-3,-6,-4,-5,-4,-7,-3,-5,-2), type = "bar", options = list(fill = js_fun))
```

## Rmarkdown

Use in rmarkdown in-line like so ``r peity(c(1,4,2), type = "pie")``, or in blocks like so:

```R
peity(c(1,4,2), type = "pie")
```

-----------------------------------------------

* Peity v`3.2.1`
* jquery v`3.1.1`

-----------------------------------------------

See [my other projects](http://johncoene.github.io/projects/)
