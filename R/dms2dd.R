
dms2dd<-function(v){
  s <- ifelse(stringr::str_sub(v, 1, 1) %in% c("S", "W"),
              -1,
              +1)
  w <- ifelse(stringr::str_sub(v, 1, 1) %in% c("S", "W"),
    stringr::str_replace(v, "[SW]?", ""),
    stringr::str_replace(v, "[NE]?", ""))

  z <- sapply((strsplit(w, "[°\"\']")), as.numeric)
  z <- (z[1, ] + z[2, ]/60 + z[3, ]/3600) * s
  return(z)
}
