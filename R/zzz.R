datacache <- new.env(hash=TRUE, parent=emptyenv())

org.Spombe.eg <- function() showQCData("org.Spombe.eg", datacache)
org.Spombe.eg_dbconn <- function() dbconn(datacache)
org.Spombe.eg_dbfile <- function() dbfile(datacache)
org.Spombe.eg_dbschema <- function(file="", show.indices=FALSE) dbschema(datacache, file=file, show.indices=show.indices)
org.Spombe.eg_dbInfo <- function() dbInfo(datacache)

org.Spombe.egORGANISM <- "Schizosaccharomyces pombe"

.onLoad <- function(libname, pkgname)
{
    require("methods", quietly=TRUE)
    ## Connect to the SQLite DB
    dbfile <- system.file("extdata", "org.Spombe.eg.sqlite", package=pkgname, lib.loc=libname)
    assign("dbfile", dbfile, envir=datacache)
    dbconn <- dbFileConnect(dbfile)
    assign("dbconn", dbconn, envir=datacache)

    ## Create the OrgDb object
    sPkgname <- sub(".db$","",pkgname)
    txdb <- loadDb(system.file("extdata", paste(sPkgname,
      ".sqlite",sep=""), package=pkgname, lib.loc=libname),
                   packageName=pkgname)    
    dbNewname <- AnnotationDbi:::dbObjectName(pkgname,"OrgDb")
    ns <- asNamespace(pkgname)
    assign(dbNewname, txdb, envir=ns)
    namespaceExport(ns, dbNewname)
        
    ## Create the AnnObj instances
    ann_objs <- createAnnObjs.SchemaChoice("ORGANISM_DB", "org.Spombe.eg", "chip org.Spombe.eg", dbconn, datacache)
    mergeToNamespaceAndExport(ann_objs, pkgname)
    packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.Spombe.eg.db"))
}

.onUnload <- function(libpath)
{
    dbFileDisconnect(org.Spombe.eg_dbconn())
}

