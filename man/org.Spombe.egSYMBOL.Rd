\name{org.Spombe.egSYMBOL}
\alias{org.Spombe.egSYMBOL}
\alias{org.Spombe.egSYMBOL2EG}
\title{Map between Entrez Gene Identifiers and Gene Symbols}
\description{
  org.Spombe.egSYMBOL is an R object that provides mappings between
  entrez gene identifiers and gene abbreviations. 
}
\details{
  Each entrez gene identifier is mapped to the a common abbreviation for 
  the corresponding gene. An \code{NA} is reported if there is no known
  abbreviation for a given gene.
  
  Symbols typically consist of 3 letters that define either a single
  gene (ABC) or multiple genes (ABC1, ABC2, ABC3). Gene symbols can be
  used as key words to query public databases such as Entrez Gene.

  Mappings were based on data provided by: Entrez Gene  
  ftp://ftp.ncbi.nlm.nih.gov/gene/DATA  
  With a date stamp from the source of: Fri Aug 30 17:59:00 2013
  
}
\references{
  \url{http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=gene}
}
\examples{
        x <- org.Spombe.egSYMBOL
        # Get the gene symbol that are mapped to an entrez gene identifiers
        mapped_genes <- mappedkeys(x)
        # Convert to a list
        xx <- as.list(x[mapped_genes])
        if(length(xx) > 0) {
          # Get the SYMBOL for the first five genes
          xx[1:5]
          # Get the first one
          xx[[1]]
        }
        # For the reverse map:
        x <- org.Spombe.egSYMBOL2EG
        # Get the entrez gene identifiers that are mapped to a gene symbol
        mapped_genes <- mappedkeys(x)
        # Convert to a list
        xx <- as.list(x[mapped_genes])
        if(length(xx) > 0) {
          # Get the entrez gene ID for the first five genes
          xx[1:5]
          # Get the first one
          xx[[1]]
        }
}

\keyword{datasets}


