
#' Standard interface for distinct.
#'
#' Group a data frame and add per-group indices as a column.
#'
#' @seealso \code{\link[dplyr]{distinct}}
#'
#' @param .data data.frame
#' @param groupingVars character vector of column names to group by.
#' @param .keep_all logical, passed to dplyr::distinct.
#' @return .data passed through distinct with groupingVars args.
#'
#' @examples
#'
#'
#' datasets::mtcars %.>% distinct_se(., c("cyl", "gear"))
#'
#' @export
#'
distinct_se <- function(.data, groupingVars, .keep_all = FALSE) {
  if(!(is.data.frame(.data) || dplyr::is.tbl(.data))) {
    stop("seplyr::distinct_se first argument must be a data.frame or tbl")
  }
  if(!is.character(groupingVars)) {
    stop("seplyr::distinct_se groupingVars must be a character vector")
  }
  # convert char vector into spliceable vector
  groupingSyms <- rlang::syms(groupingVars)
  dplyr::distinct(.data = .data, !!!groupingSyms, .keep_all = .keep_all)
}
