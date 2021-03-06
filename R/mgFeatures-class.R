## ========================= mgFeature Class ========================
#' mgFeature-class object
#'
#' Object contains taxonomic annotation and reference sequence data for
#' classified OTUs. The class extends the \link[Biobase]{AnnotatedDataFrame}
#' class with a slot with a subset of the reference database sequences and
#' phylogenetic tree for taxonomically classified OTUs, along with an additional
#' slot for metadata including information on the database source.
#'
#' @slot metadata list
#' @slot refDbSeq DNAStringSet
#' @slot refDbTree phyloOrNULL
#' @return mgFeature class object
#' @export
#' @examples
#' data(mock_mgF)
#' @rdname mgFeatures-class
setClass("mgFeatures",
         slots = list(metadata = "list",
                      refDbSeq="DNAStringSet",
                      refDbTree = "phyloOrNULL"),
         contains = c("AnnotatedDataFrame"),
         prototype = new("VersionedBiobase",
                         versions = c(classVersion("AnnotatedDataFrame"),
                                      mgFeatures = "1.0.1"))
)

## making sure new object conforms to class definition
setValidity("mgFeatures", function(object) {
    msg <- NULL
    if(!("refDbSeq" %in% slotNames(object)) ||
       !is(object@refDbSeq, "DNAStringSet"))
        msg <- paste(msg,
                     "'refDbSeq' slot must be a DNAStringSeq object",
                     sep = "\n")
    if(!("refDbTree" %in% slotNames(object)) ||
       (is(object@refDbTree, "phylo") && is(object@refDbTree, "NULL")))
        msg <- paste(msg,
                     "'refDbTree' slot must be a phylo or NULL object",
                     sep = "\n")
    if(!("metadata" %in% slotNames(object)) || !is(object@metadata, "list"))
        msg <- paste(msg, "'metadata' slot must contain a list", sep = "\n")
    if (is.null(msg)) TRUE else msg
})

################################################################################
################################################################################
##
##                              mgFeatures Methods
##
################################################################################
################################################################################
## accessors -------------------------------------------------------------------

#' mgFeatures refDbTree slot accessor
#'
#' @param mgF  mgFeatures class object
#'
#' @return phylo class object
#' @export
#'
#' @examples
#' data(mock_mgF)
#' mgF_tree(mock_mgF)
mgF_tree <- function(mgF){
    mgF@refDbTree
}

#' mgFeatures refDbSeq slot accessor
#'
#' @param mgF  mgFeatures class object
#'
#' @return DNAStringSet class object
#' @export
#'
#' @examples
#' data(mock_mgF)
#' mgF_seq(mock_mgF)
mgF_seq <- function(mgF){
    mgF@refDbSeq
}

#' mgFeatures taxa slot accessor
#'
#' @param mgF  mgFeatures class object
#'
#' @return AnnotatedDataFrame
#' @export
#'
#' @examples
#' data(mock_mgF)
#' mgF_taxa(mock_mgF)
mgF_taxa <- function(mgF){
    mgF@data
}

#' mgFeatures metadata slot accessor
#'
#' @param mgF  mgFeatures class object
#'
#' @return list
#' @export
#'
#' @examples
#' data(mock_mgF)
#' mgF_meta(mock_mgF)
mgF_meta <- function(mgF){
    mgF@metadata
}
