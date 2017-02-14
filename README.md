[![Travis-CI Build Status](https://travis-ci.org/.svg?branch=master)](https://travis-ci.org/)

# peity

[Peity](http://benpickles.github.io/peity/) htmlwidget for R.

## Install

```R
devtools::install_github("JohnCoene/peity")
```

## Examples

```R
library(peity)

peity("1/5", type = "pie")
peity(c(1,5), type = "donut", options = list(fill = I(c("green", "red")), radius = 100))
peity(c(1,5), type = "donut", options = list(fill = c("#845422", "#ead61c"), radius = 50, innerRadius = 40))
peity(rnorm(50, 2, 1), type = "line", options = list(width = 100))
peity(c(1,5,3), type = "bar", options = list(fill = I("green")))
```

-----------------------------------------------

See [my other projects](http://johncoene.github.io/projects/)
