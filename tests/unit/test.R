testForGOSourceMismatches <- function(){
  require("GO.db")
  require("annotate")
  require("org.Spombe.eg.db")
  g = Lkeys(GOTERM)
  m = Rkeys(getAnnMap('GO2EG', gsub(".db$","","org.Spombe.eg.db")))
  ##Are all the IDs from m in g?
  all((m %in% g)) 
}

msg = paste("The GO annotations are out of sync between the GO.db and the",
            " annotation package being tested.  Please ensure that GO.db",
            " is the very latest version, or update the the relevant",
            " .db0 source packages and recreate the package.", sep="")

checkTrue(testForGOSourceMismatches(),
          msg = paste(strwrap(msg, exdent=2),collapse="\n") )

getGODate <- function(){
  require(GO.db)
  dbmeta(GO_dbconn(), "GOSOURCEDATE")
}

getPkgDate <-function(){
  require("org.Spombe.eg.db")
  dbmeta(eval(call(name = paste(gsub(".db$","","org.Spombe.eg.db"),
                     "_dbconn",sep=""))), "GOSOURCEDATE")
}

msg = paste("The date stamps for the GO annotations are out of sync between",
             " the GO.db and the annotation package being tested.  Please",
             " ensure that GO.db is the very latest version, or update to",
             " the relevant .db0 source packages to recreate the package.",
             sep="")

checkIdentical(getGODate(), getPkgDate(), 
               msg = paste(strwrap(msg, exdent=2),collapse="\n") )
