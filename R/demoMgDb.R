#' Example MgDb-class object
#'
#' Example \link[=MgDb]{MgDb-class} object with 3211 entries from the Greengenes
#' 13.8 OTU 99 database.
#' @return MgDb-class object
#' @export
#' @examples
#'  get_demoMgDb()
get_demoMgDb <- function(){
    metadata <- list(ACCESSION_DATE = "3/31/2015",
                     URL = "https://greengenes.microbio.me",
                     DB_TYPE_NAME = "GreenGenes",
                     DB_TYPE_VALUE = "MgDb",
                     DB_SCHEMA_VERSION = "1.0")

    demo_seq_file <- system.file("extdata", 'mockSeq.fasta.gz',
                                 package="metagenomeFeatures")

    db_seq <- Biostrings::readDNAStringSet(demo_seq_file)

    demo_taxa_file <- system.file("extdata", "mockTaxa.sqlite",
                                  package="metagenomeFeatures")

    demo_tree_file <- system.file("extdata", "mockTree.rds",
                                  package="metagenomeFeatures")

    demoMgDb <- new("MgDb",
                    seq = db_seq,
                    taxa_file = demo_taxa_file,
                    tree_file = demo_tree_file,
                    metadata = metadata)
}
