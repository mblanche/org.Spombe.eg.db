\name{org.Spombe.egACCNUM}
\alias{org.Spombe.egACCNUM}
\alias{org.Spombe.egACCNUM2EG}
\title{Map Entrez Gene identifiers to GenBank Accession Numbers}  
\description{ 
  org.Spombe.egACCNUM is an R object that contains mappings between 
  Entrez Gene identifiers and GenBank accession numbers.    
}
\details{
  This object is a simple mapping of Entrez Gene identifiers
  \url{http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=gene} to all possible GenBank 
  accession numbers.

  Mappings were based on data provided by: Entrez Gene  
  ftp://ftp.ncbi.nlm.nih.gov/gene/DATA  
  With a date stamp from the source of: Fri Aug 30 17:59:00 2013
}

\examples{
    x <- org.Spombe.egACCNUM
    # Get the entrez gene identifiers that are mapped to an ACCNUM
    mapped_genes <- mappedkeys(x)
    # Convert to a list
    xx <- as.list(x[mapped_genes])
    if(length(xx) > 0) {
      # Get the ACCNUM for the first five genes
      xx[1:5]
      # Get the first one
      xx[[1]]
    }

}
\keyword{datasets}



