load_frag_map <- function(path) {
  source(path)
  if (!exists("frag_map")) stop("frag_map not found in file")
  return(frag_map)
}