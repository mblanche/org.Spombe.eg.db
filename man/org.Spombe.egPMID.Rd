\name{org.Spombe.egPMID}
\alias{org.Spombe.egPMID}
\alias{org.Spombe.egPMID2EG}
\title{Map between Entrez Gene Identifiers and PubMed Identifiers}
\description{
   org.Spombe.egPMID is an R object that provides mappings between
   entrez gene identifiers and PubMed identifiers.
}
\details{
  Each entrez gene identifier is mapped to a named vector of PubMed identifiers. The
  name associated with each vector corresponds to the entrez gene identifier. 
  The length of the vector may be one or greater, depending on how
  many PubMed identifiers a given entrez gene identifier is mapped to. An \code{NA} is
  reported for any entrez gene identifier that cannot be mapped to a PubMed identifier.

  Titles, abstracts, and possibly full texts of articles can be obtained
  from PubMed by providing a valid PubMed identifier. The pubmed function of
  annotate can also be used for the same purpose.

  Mappings were based on data provided by: Entrez Gene  
  ftp://ftp.ncbi.nlm.nih.gov/gene/DATA  
  With a date stamp from the source of: Fri Aug 30 17:59:00 2013

}
\references{
  \url{http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=PubMed}
}
\examples{
        x <- org.Spombe.egPMID
        # Get the entrez gene identifiers that are mapped to any PubMed ID
        mapped_genes <- mappedkeys(x)
        # Convert to a list
        xx <- as.list(x[mapped_genes])
    if(length(xx) > 0){
        # The entrez gene identifiers for the first two elements of XX
        xx[1:2]
        # Get the first one
        xx[[1]]
        if(interactive() && !is.null(xx[[1]]) && !is.na(xx[[1]])
           && require(annotate)){
            # Gets article information as XML files
            xmls <- pubmed(xx[[1]], disp = "data")
            # Views article information using a browser
            pubmed(xx[[1]], disp = "browser")
        }
    }
    # For the reverse map:
    # Convert the object to a list
    xx <- as.list(org.Spombe.egPMID2EG)
    if(length(xx) > 0){
        # The entrez gene identifiers for the first two elements of XX
        xx[1:2]
        # Get the first one
        xx[[1]]
        if(interactive() && require(annotate)){
            # Gets article information as XML files for a PubMed id
            xmls <- pubmed(names(xx)[1], disp = "data")
            # Views article information using a browser
            pubmed(names(xx)[1], disp = "browser")
        }
    }
}
\keyword{datasets}

