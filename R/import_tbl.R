import_tbl <- function(file_path) {
  db <- readxl::read_excel(file_path)
  db$Latd <- dms2dd(db$Lat)
  db$Lond <- dms2dd(db$Lon)
  # date recognized correctly
  # fecha de siembra inconsistent format
  # inconsistent capitalization in estado fenologica
  # only one estado fenologico
  #
  db
}

# fp <- "inst/db/2- BASE DE DATOS MUESTREO ROYA EN CAMPO-3.xlsx"
#
# db <- import_tbl(fp)
