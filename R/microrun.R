#' microclimate model
#'
#' R wrapper for Fortran binary of Niche Mapper microclimate model
#' @param micro A vector of input variables for the microclimate model
#' @return metout The above ground micrometeorological conditions under the minimum specified shade
#' @return shadmet The above ground micrometeorological conditions under the maximum specified shade
#' @return soil Hourly predictions of the soil temperatures under the minimum specified shade
#' @return shadsoil Hourly predictions of the soil temperatures under the maximum specified shade
#' @return soilmoist Hourly predictions of the soil moisture under the minimum specified shade
#' @return shadmoist Hourly predictions of the soil moisture under the maximum specified shade
#' @return soilpot Hourly predictions of the soil water potential under the minimum specified shade
#' @return shadpot Hourly predictions of the soil water potential under the maximum specified shade
#' @return humid Hourly predictions of the soil humidity under the minimum specified shade
#' @return shadhumid Hourly predictions of the soil humidity under the maximum specified shade
#' @useDynLib "MICROCLIMATE"
#' @export
microclimate <- function(micro) {
  julnum<-micro$microinput[1]
# hacky workaround for problem that microclimate DLL loads as 'microclimate' when building the vignettes
# so have to check if this is happening and run the first block of the if statement below, otherwise
# the vignette build isn't happening, the model is just being run under normal cirumstances, so the
# second block is run. Presumably this would be avoided if source code was part of the package rather
# than working with foreign DLLs
  if(Sys.info()['sysname']=="Windows"){
    if(R.Version()$arch=="x86_64"){
     libpath='/NicheMapR/libs/x64/microclimate.dll'
    }else{
     libpath='/NicheMapR/libs/i386/microclimate.dll'
    }
  }else{
    libpath='/NicheMapR/libs/MICROCLIMATE.so'
  }
 if(is.loaded("microclimate", "MICROCLIMATE", type = "FORTRAN")==FALSE){
   dyn.load(paste(lib.loc = .libPaths()[1],libpath,sep=""))
  a <- .Fortran("microclimate",
    as.integer(julnum),
    as.double(micro$microinput),
    as.double(micro$julday),
    as.double(micro$SLES),
    as.double(micro$DEP),
    as.double(micro$MAXSHADES),
    as.double(micro$MINSHADES),
    as.double(micro$Nodes),
    as.double(micro$TIMAXS),
    as.double(micro$TIMINS),
    as.double(micro$RHMAXX),
    as.double(micro$RHMINN),
    as.double(micro$CCMAXX),
    as.double(micro$CCMINN),
    as.double(micro$WNMAXX),
    as.double(micro$WNMINN),
    as.double(micro$TMAXX),
    as.double(micro$TMINN),
    as.double(micro$REFLS),
    as.double(micro$PCTWET),
    as.double(micro$soilinit),
    as.double(micro$hori),
    as.double(micro$TAI),
    as.double(micro$soilprop),
    as.double(micro$moists),
    as.double(micro$RAINFALL),
    as.double(micro$tannulrun),
    as.double(micro$tides),
    as.double(micro$PE),
    as.double(micro$KS),
    as.double(micro$BB),
    as.double(micro$BD),
    as.double(micro$L),
    as.double(micro$LAI),
    as.double(micro$TAIRhr),
    as.double(micro$RHhr),
    as.double(micro$WNhr),
    as.double(micro$CLDhr),
    as.double(micro$SOLRhr),
    as.double(micro$RAINhr),
    metout=matrix(data = 0., nrow = 24*julnum, ncol = 18),
    soil=matrix(data = 0., nrow = 24*julnum, ncol = 12),
    shadmet=matrix(data = 0., nrow = 24*julnum, ncol = 18),
    shadsoil=matrix(data = 0., nrow = 24*julnum, ncol = 12),
    soilmoist=matrix(data = 0., nrow = 24*julnum, ncol = 12),
    shadmoist=matrix(data = 0., nrow = 24*julnum, ncol = 12),
    humid=matrix(data = 0., nrow = 24*julnum, ncol = 12),
    shadhumid=matrix(data = 0., nrow = 24*julnum, ncol = 12),
    soilpot=matrix(data = 0., nrow = 24*julnum, ncol = 12),
    shadpot=matrix(data = 0., nrow = 24*julnum, ncol = 12),PACKAGE = "microclimate")

dyn.unload(paste(lib.loc = .libPaths()[1],libpath,sep=""))
 }else{

  a <- .Fortran("microclimate",
    as.integer(julnum),
    as.double(micro$microinput),
    as.double(micro$julday),
    as.double(micro$SLES),
    as.double(micro$DEP),
    as.double(micro$MAXSHADES),
    as.double(micro$MINSHADES),
    as.double(micro$Nodes),
    as.double(micro$TIMAXS),
    as.double(micro$TIMINS),
    as.double(micro$RHMAXX),
    as.double(micro$RHMINN),
    as.double(micro$CCMAXX),
    as.double(micro$CCMINN),
    as.double(micro$WNMAXX),
    as.double(micro$WNMINN),
    as.double(micro$TMAXX),
    as.double(micro$TMINN),
    as.double(micro$REFLS),
    as.double(micro$PCTWET),
    as.double(micro$soilinit),
    as.double(micro$hori),
    as.double(micro$TAI),
    as.double(micro$soilprop),
    as.double(micro$moists),
    as.double(micro$RAINFALL),
    as.double(micro$tannulrun),
    as.double(micro$tides),
    as.double(micro$PE),
    as.double(micro$KS),
    as.double(micro$BB),
    as.double(micro$BD),
    as.double(micro$L),
    as.double(micro$LAI),
    as.double(micro$TAIRhr),
    as.double(micro$RHhr),
    as.double(micro$WNhr),
    as.double(micro$CLDhr),
    as.double(micro$SOLRhr),
    as.double(micro$RAINhr),
    metout=matrix(data = 0., nrow = 24*julnum, ncol = 18),
    soil=matrix(data = 0., nrow = 24*julnum, ncol = 12),
    shadmet=matrix(data = 0., nrow = 24*julnum, ncol = 18),
    shadsoil=matrix(data = 0., nrow = 24*julnum, ncol = 12),
    soilmoist=matrix(data = 0., nrow = 24*julnum, ncol = 12),
    shadmoist=matrix(data = 0., nrow = 24*julnum, ncol = 12),
    humid=matrix(data = 0., nrow = 24*julnum, ncol = 12),
    shadhumid=matrix(data = 0., nrow = 24*julnum, ncol = 12),
    soilpot=matrix(data = 0., nrow = 24*julnum, ncol = 12),
    shadpot=matrix(data = 0., nrow = 24*julnum, ncol = 12),PACKAGE = "MICROCLIMATE")

  # need to load and unload the microclimate dll or else it crashes second time round - probably due to memory leak
#if(is.loaded("microclimate", "MICROCLIMATE", type = "FORTRAN")){
    library.dynam.unload("MICROCLIMATE", path.package("NicheMapR"))
#}
  library.dynam("MICROCLIMATE", "NicheMapR", lib.loc = .libPaths()[1])
#dyn.unload(paste(lib.loc = .libPaths()[1],'/NicheMapR/libs/x64/microclimate.dll',sep=""))
 }
  metout <- matrix(data = 0., nrow = 24*julnum, ncol = 18)
  shadmet <- matrix(data = 0., nrow = 24*julnum, ncol = 18)
  soil <- matrix(data = 0., nrow = 24*julnum, ncol = 12)
  shadsoil <- matrix(data = 0., nrow = 24*julnum, ncol = 12)
  soilmoist <- matrix(data = 0., nrow = 24*julnum, ncol = 12)
  shadmoist <- matrix(data = 0., nrow = 24*julnum, ncol = 12)
  humid <- matrix(data = 0., nrow = 24*julnum, ncol = 12)
  shadhumid <- matrix(data = 0., nrow = 24*julnum, ncol = 12)
  soilpot <- matrix(data = 0., nrow = 24*julnum, ncol = 12)
  shadpot <- matrix(data = 0., nrow = 24*julnum, ncol = 12)
  storage.mode(metout)<-"double"
  storage.mode(shadmet)<-"double"
  storage.mode(soil)<-"double"
  storage.mode(shadsoil)<-"double"
  storage.mode(soilmoist)<-"double"
  storage.mode(shadmoist)<-"double"
  storage.mode(humid)<-"double"
  storage.mode(shadhumid)<-"double"
  storage.mode(soilpot)<-"double"
  storage.mode(shadpot)<-"double"
  metout<-a$metout
  shadmet<-a$shadmet
  soil<-a$soil
  shadsoil<-a$shadsoil
  soilmoist<-a$soilmoist
  shadmoist<-a$shadmoist
  humid<-a$humid
  shadhumid<-a$shadhumid
  soilpot<-a$soilpot
  shadpot<-a$shadpot
  metout.names<-c("JULDAY","TIME","TALOC","TAREF","RHLOC","RH","VLOC","VREF","SNOWMELT","POOLDEP","PCTWET","ZEN","SOLR","TSKYC","DEW","FROST","SNOWFALL","SNOWDEP")
  colnames(metout)<-metout.names
  colnames(shadmet)<-metout.names
  soil.names<-c("JULDAY","TIME",paste("D",micro$DEP,"cm", sep = ""))
  colnames(soil)<-soil.names
  colnames(shadsoil)<-soil.names
  moist.names<-c("JULDAY","TIME",paste("WC",micro$DEP,"cm", sep = ""))
  humid.names<-c("JULDAY","TIME",paste("RH",micro$DEP,"cm", sep = ""))
  pot.names<-c("JULDAY","TIME",paste("PT",micro$DEP,"cm", sep = ""))
  colnames(soilmoist)<-moist.names
  colnames(shadmoist)<-moist.names
  colnames(humid)<-humid.names
  colnames(shadhumid)<-humid.names
  colnames(soilpot)<-pot.names
  colnames(shadpot)<-pot.names
  return (list(metout=metout, soil=soil, shadmet=shadmet, shadsoil=shadsoil, soilmoist=soilmoist, shadmoist=shadmoist, humid=humid, shadhumid=shadhumid, soilpot=soilpot, shadpot=shadpot))
}
