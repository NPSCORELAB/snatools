#' Build a networks's edge list representation.
#' 
#' `rep_edgelist()` creates edge lists in a _consistent_ format across classes.
#' 
#' @param x An `igraph` or `network` object.
#' @param use_names 
#' `logical` Whether the returned edge list should use vertex names instead of their
#'  indices. \cr
#'  Default: `FALSE`
#'
#' @details 
#' * If `x` is _directed_, columns are named `"from"` and `"to"` to indicate the
#' tie's direction.
#' * If `x` is _undirected_, columns are named `"vert1"` and `"vert2"`.
#' 
#' @return `matrix` \cr
#' * `mode()`:
#'     + `numeric` if `use_names` is `FALSE`.
#'     + `character` if `use_names` is `TRUE`.
#' * `dim()`
#'     + `igraph::ecount(x)` by 2 if `x` is an `igraph` object.
#'     + `network::network.edgecount(x)` by 2 if `x` is a `network` object.
#' 
#' @seealso [`igraph::as_edgelist()`], [`network::as.edgelist()`]
#' 
#' @author Brendan Knapp \email{brendan.g.knapp@@gmail.com}
#' 
#' @examples 
#' library(snatools)
#' 
#' # igraph ==============================================================================
#' data("karate", package = "igraphdata") # loads "Zachary's Karate Club" as `karate`
#' karate
#' 
#' karate %>% 
#'   rep_edgelist() %>% 
#'   head()
#'   
#' karate %>% 
#'   rep_edgelist(use_names = TRUE) %>% 
#'   head()
#' 
#' # network =============================================================================
#' data("sampson", package = "ergm") # loads "Sampson's Monks" as `samplike`
#' samplike
#' 
#' samplike %>% 
#'   rep_edgelist() %>% 
#'   head()
#'   
#' samplike %>% 
#'   rep_edgelist(use_names = TRUE) %>% 
#'   head()
#' 
#' @export
rep_edgelist <- function(x, ...) {
  UseMethod("rep_edgelist")
}

#' @rdname rep_edgelist
#' 
#' @export
#' 
rep_edgelist.igraph <- function(ig, use_names = FALSE) {
  out <- igraph::as_edgelist(ig, names = use_names)
  if(igraph::is_directed(ig)) {
    colnames(out) <- c("from", "to")
  } else {
    colnames(out) <- c("vert1", "vert2")
  }
  out
}

#' @rdname rep_edgelist
#' 
#' @export
#' 
rep_edgelist.network <- function(x, use_names = FALSE) {
  # out <- network::as.matrix.network.edgelist(x)
  # attr(out, "n") <- NULL
  # attr(out, "vnames") <- NULL
  # out
  outl <- lapply(x$mel, `[[`, "outl")
  outl <- unlist(outl)
  inl <- lapply(x$mel, `[[`, "inl")
  inl <- unlist(inl)
  if(x$gal$directed) {
    out <- cbind(outl, inl)
    colnames(out) <- c("from", "to")
  } else {
    out <- cbind(inl, outl)
    colnames(out) <- c("vert1", "vert2")
  }
  if(is.integer(out)) {
    out <- apply(out, 2, as.double)
  }
  if(!use_names) {
    return(out)
  }
  vert_names <- vapply(x$val, function(x) x[["vertex.names"]], character(1))
  matrix(vert_names[out], ncol = 2, dimnames = list(NULL, colnames(out)))
}

#' Build a network's adjacency matrix representation
#' 
#' @param x
#' @param edg_attr
#' @param sparse
#' @param ...
#' 
#' @return `matrix` or `dgCMatrix`
#' 
#' @examples 
#' library(snatools)
#' 
#' data("sampson", package = "ergm")
#' 
#' rep_adjacency_matrix(samplike)
#' 
#' @export
#' 
rep_adjacency_matrix <- function(x, ...) {
  UseMethod("rep_adjacency_matrix")
}

#' @rdname rep_adjacency_matrix
#' 
#' @export
#' 
rep_adjacency_matrix.igraph <- function(x, edg_attr = NULL, sparse = FALSE, ...) {
  igraph::as_adjacency_matrix(x, attr = edg_attr, sparse = sparse, ...)
}

#' @rdname rep_adjacency_matrix
#' 
#' @export
#' 
rep_adjacency_matrix.network <- function(x, edg_attr = NULL, ...) {
  if(!length(edg_attr)) {
    out <- network::as.matrix.network.adjacency(x, ...)
  } else {
    out <- network::as.matrix.network.adjacency(x, attrname = edg_attr, ...)
  }
  out
}

#' rep_two_mode_matrix
#' 
#' @export
#' 
rep_two_mode_matrix <- function(x, edg_attr = NULL, sparse = FALSE, ...) {
  UseMethod("rep_two_mode_matrix")
}

#' @rdname rep_two_mode_matrix
#' 
#' @export
#' 
rep_two_mode_matrix.igraph <- function(x, edg_attr = NULL, sparse = FALSE, ...) {
  if(!igraph::is_bipartite(x)) {
    stop("`x` is not bipartite; it cannot be two modes.", call. = FALSE)
  }
  out <- igraph::as_incidence_matrix(attr = edg_attr, sparse = FALSE, ...)
}

#' @rdname rep_two_mode_matrix
#' 
#' @export
#' 
rep_two_mode_matrix.network <- function(x, edg_attr = NULL, sparse = FALSE, ...) {
  if(!x$gal$bipartite) {
    stop("`x` is not bipartite so it cannot be two modes.", call. = FALSE)
  }
  
  
  rep_adjacency_matrix(x, edg_attr = edg_attr, sparse = sparse, ...)
}

#' rep_biadjacency_matrix
#' 
#' @export
#' 
rep_biadjacency_matrix <- function(x, ...) {
  UseMethod("rep_biadjacency_matrix")
}

#' @rdname rep_biadjacency_matrix
#' 
#' @export
#' 
rep_biadjacency_matrix.igraph <- function(x, ...) {
  if(!igraph::is_bipartite(x)) {
    stop("`x` is not bipartite. Use `rep_adjacency_matrix()` instead.")
  }
  igraph::as_adjacency_matrix(x, ...)
}

#' @rdname rep_biadjacency_matrix
#' 
#' @export
#' 
rep_biadjacency_matrix.network <- function(x, ...) {
  if(!x$gal$bipartite) {
    stop("`x` is not bipartite. Use `rep_adjacency_matrix()` instead.")
  }
  network::as.matrix.network.adjacency(x, expand.bipartite = TRUE, ...)
}



#' @rdname rep_adjacency_matrix
#' 
#' @details
#' `rep_attr_adj_mat()` creates an adjacency matrix replacing vertex names with the category
#' in `vrt_attr` to which each vertex belongs.
#' 
#' @export
#' 
rep_attr_adj_mat <- function(x, vrt_attr) {
  UseMethod("rep_attr_adj_mat")
}

#' @rdname rep_adjacency_matrix
#' 
#' @export
#' 
rep_attr_adj_mat.igraph <- function(x, vrt_attr) {
  attrs <- vrt_get_attr(x, vrt_attr = vrt_attr)
  if(is.null(attrs)) {
    stop("No vertex attributes named `vrt_attr` found.")
  }
  # attrs <- network::get.vertex.attribute(x, vrt_attr)
  out <- rep_adjacency_matrix(x)
  rownames(out) <- attrs
  colnames(out) <- attrs
  class(out) <- c("attr_adj_mat", "matrix")
  
  out
}

#' @rdname rep_adjacency_matrix
#' 
#' @export
#' 
rep_attr_adj_mat.network <- function(x, vrt_attr) {
  # attrs <- unlist(lapply(lapply(x$val, `[`), `[[`, vrt_attr))
  attrs <- vrt_get_attr(x, vrt_attr)
  out <- rep_adjacency_matrix(x)
  rownames(out) <- attrs
  colnames(out) <- attrs
  class(out) <- c("attr_adj_mat", "matrix")
  
  out
}

#' @rdname rep_edgelist
#' 
#' @param vrt_attr `character`. Name of target vertex attribute.
#' 
#' @details `rep_attr_el()` creates an edge list replacing vertex names with the category
#' in `vrt_attr` to which each vertex belongs.
#' 
#' @export
#' 
rep_attr_el <- function(x, vrt_attr) {
  UseMethod("rep_attr_el")
}

#' @rdname rep_edgelist
#' 
#' @export
#' 
rep_attr_el.attr_adj_mat <- function(x, vrt_attr) {
  # attr_adj_mat <- rep_attr_adj_mat(x, vrt_attr)
  combos <- expand.grid(rownames(x), colnames(x), 
                        stringsAsFactors = FALSE)
  el_df <- cbind(combos, setNames(data.frame(as.vector(x)), "value"))
  out <- as.matrix(el_df[el_df$value > 0, c(1, 2)])
  colnames(out) <- c("from", "to")
  class(out) <- c("attr_el", "matrix")
  
  out
}

#' @rdname rep_edgelist
#' 
#' @export
#'
rep_attr_el.igraph <- function(x, vrt_attr) {
  attrs <- vrt_get_attr(x, vrt_attr)
  el <- rep_edgelist(x)
  out <- matrix(attrs[el], ncol = 2)
  colnames(out) <- c("from", "to")
  class(out) <- c("attr_el", "matrix")
  
  out
}

#' @rdname rep_edgelist
#' 
#' @export
#'
rep_attr_el.network <- function(x, vrt_attr) {
  attrs <- vrt_get_attr(x, vrt_attr)
  el <- rep_edgelist(x)
  out <- matrix(attrs[el], ncol = 2)
  colnames(out) <- c("from", "to")
  class(out) <- c("attr_el", "matrix")
  
  out
}

#' Build a network/graph's mixing matrix.
#' 
#' @param x An `igraph` or `network` object.
#' @param vrt_attr `character` representing a vertex attribute.
#' 
#' 
#' @export
#' 
rep_mixing_matrix <- function(x, vrt_attr, drop_loops = FALSE) {
  UseMethod("rep_mixing_matrix")
}

#' @rdname rep_mixing_matrix
#' 
#' @export
#' 
rep_mixing_matrix.igraph <- function(x, vrt_attr, drop_loops = FALSE) {
  if(drop_loops) {
    x <- drop_loops(x)
  }
  attrs <- vrt_get_attr(x, vrt_attr)
  cats <- sort(unique(attrs))
  el <- rep_edgelist(x)
  el_list <- list(el[, 1], el[, 2])
  
  from <- factor(attrs[el[, 1]], levels = cats)
  to <- factor(attrs[el[, 2]], levels = cats)
  out <- table(from, to)
  class(out) <- c("mixing_matrix", "matrix")
  
  out
}

#' @rdname rep_mixing_matrix
#' 
#' @export
#' 
rep_mixing_matrix.network <- function(x, vrt_attr, drop_loops = FALSE) {
  if(drop_loops) {
    x <- drop_loops(x)
  }
  attrs <- vrt_get_attr(x, vrt_attr)
  cats <- sort(unique(attrs))
  el <- rep_edgelist(x)
  el_list <- list(el[, 1], el[, 2])
  
  from <- factor(attrs[el[, 1]], levels = cats)
  to <- factor(attrs[el[, 2]], levels = cats)
  out <- table(from, to)
  class(out) <- c("mixing_matrix", "matrix")
  
  out
}


