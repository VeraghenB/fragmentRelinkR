validate_fragments <- function(frag_map, seurat_obj) {
  
  frag_vec <- unlist(frag_map)
  sample_ids <- seurat_obj@meta.data$Sample_name
  
  message("Checking mapping consistency...")
  
  if (!all(sample_ids %in% names(frag_vec))) {
    stop("Some Sample_name entries are missing in frag_map.")
  }
  
  frag_paths <- frag_vec[sample_ids]
  
  message("Checking file existence...")
  missing_files <- frag_paths[!file.exists(frag_paths)]
  
  if (length(missing_files) > 0) {
    stop("Missing files:\n", paste(missing_files, collapse = "\n"))
  }
  
  message("All checks passed ✔")
  return(TRUE)
}