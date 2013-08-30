\name{org.Spombe.egREFSEQ}
\alias{org.Spombe.egREFSEQ}
\alias{org.Spombe.egREFSEQ2EG}
\title{Map between Entrez Gene Identifiers and RefSeq Identifiers}
\description{
   org.Spombe.egREFSEQ is an R object that provides mappings between
   entrez gene identifiers and RefSeq identifiers.
}
\details{
  Each entrez gene identifier is mapped to a named vector of RefSeq
  identifiers. The name represents the entrez gene identifier and the
  vector contains all RefSeq identifiers that can be mapped to that
  entrez gene identifier. The length of the vector may be one or
  greater, depending on how many RefSeq identifiers a given entrez gene
  identifier can be mapped to. An \code{NA} is reported for any entrex
  gene identifier that cannot be mapped to a RefSeq identifier at this
  time.

  RefSeq identifiers differ in format according to the type of record the identifiers
  are for as shown below:

  NG\_XXXXX: RefSeq accessions for genomic region (nucleotide) records

  NM\_XXXXX: RefSeq accessions for mRNA records

  NC\_XXXXX: RefSeq accessions for chromosome records

  NP\_XXXXX: RefSeq accessions for protein records

  XR\_XXXXX: RefSeq accessions for model RNAs that are not associated with
  protein products

  XM\_XXXXX: RefSeq accessions for model mRNA records

  XP\_XXXXX: RefSeq accessions for model protein records

  Where XXXXX is a sequence of integers.

  NCBI \url{http://www.ncbi.nlm.nih.gov/RefSeq/} allows users to query
  the RefSeq database using RefSeq identifiers.

  Mappings were based on data provided by: Entrez Gene  
  ftp://ftp.ncbi.nlm.nih.gov/gene/DATA  
  With a date stamp from the source of: Fri Aug 30 17:59:00 2013

}
\references{
    \url{http://www.ncbi.nlm.nih.gov}
    \url{http://www.ncbi.nlm.nih.gov/RefSeq/} 
}
\examples{
        x <- org.Spombe.egREFSEQ
        # Get the entrez gene identifiers that are mapped to any RefSeq ID
        mapped_genes <- mappedkeys(x)
        # Convert to a list
        xx <- as.list(x[mapped_genes])
        if(length(xx) > 0) {
          # Get the REFSEQ for the first five genes
          xx[1:5]
          # Get the first one
          xx[[1]]
        }

        # For the reverse map:
        x <- org.Spombe.egREFSEQ2EG
        # Get the RefSeq identifier that are mapped to an entrez gene ID
        mapped_seqs <- mappedkeys(x)
        # Convert to a list
        xx <- as.list(x[mapped_seqs])
        if(length(xx) > 0) {
          # Get the entrez gene for the first five Refseqs
          xx[1:5]
          # Get the first one
          xx[[1]]
        }
}

\keyword{datasets}

