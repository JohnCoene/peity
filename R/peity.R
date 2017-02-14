#' Peity
#'
#' Make Peity in-line chart
#'
#' @param values values to plot.
#' @param type type of chart defaults to \code{pie}, see details for valid values.
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param elementId \code{string} id as a valid \code{CSS} element id.
#' @param options \code{list} of options, see details.
#'
#' @details
#' Valid values for \code{type}:
#' \itemize{
#'   \item{pie}
#'   \item{donut}
#'   \item{bar}
#'   \item{line}
#' }
#'
#' Valid options by \code{type}:
#' \itemize{
#'   \item{pie:}{ \code{delimiter}, \code{fill}, \code{height}, \code{width}, \code{radius}}
#'   \item{donut:} {same as ie (above) + \code{innerRadius}}
#'   \item{line:}{ \code{delimiter}, \code{fill}, \code{height}, \code{width}, \code{max}, \code{min}, \code{stroke}, \code{strokeWidth}}
#'   \item{bar:}{ \code{delimiter}, \code{fill}, \code{height}, \code{wdith}, \code{max}, \code{min}, \code{padding}}
#' }
#'
#' @examples
#' \dontrun{
#' peity("1/5", type = "pie")
#' peity(c(1,5), type = "donut", options = list(fill = I(c("green", "red")),
#'                                          radius = 100))
#' peity(c(1,5), type = "donut", options = list(fill = c("#845422", "#ead61c"),
#'                                          radius = 50, innerRadius = 40))
#' peity(rnorm(50, 2, 1), type = "line", options = list(width = 100))
#' peity(c(1,5,3), type = "bar", options = list(fill = I("green")))
#' 
#' peity(c(4,-2,3, -4), type = "bar", options = list(fill = htmlwidgets::JS('function(value) {
#'    return value > 0 ? "green" : "red"
#' }')))
#'    
#' js_fun <- htmlwidgets::JS('function(_, i, all) {
#'     var g = parseInt((i / all.length) * 255)
#'     return "rgb(255, " + g + ", 0)"
#' }')
#'     
#' peity(c(0,-3,-6,-4,-5,-4,-7,-3,-5,-2), type = "bar", options = list(fill = js_fun))
#' }
#'
#' @import htmlwidgets
#'
#' @export
peity <- function(values, type = "pie", options, width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    values = values,
    type = tolower(type),
    options = if(!missing(options)) options
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'peity',
    x,
    width = width,
    height = height,
    sizingPolicy = htmlwidgets::sizingPolicy(
      viewer.fill = FALSE
    ),
    package = 'peity',
    elementId = elementId
  )
}

peity_html <- function(id, style, class, ...){
  htmltools::tags$span(id = id, class = class)
}

#' Shiny bindings for peity
#'
#' Output and render functions for using peity within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a peity
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name peity-shiny
#'
#' @export
peityOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'peity', width, height, package = 'peity')
}

#' @rdname peity-shiny
#' @export
renderPeity <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, peityOutput, env, quoted = TRUE)
}
