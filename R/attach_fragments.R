attach_fragments <- function(
    seurat_obj,
    frag_map,
    sample_column = "Sample_name",
    assay = "MACS"
) {
  
  if (!sample_column %in% colnames(seurat_obj@meta.data)) {
    stop(sample_column, " column not found in metadata.")
  }
  
  frag_vec <- unlist(frag_map)
  
  sample_ids <- seurat_obj@meta.data[[sample_column]]
  
  samples <- unique(sample_ids)
  
  missing <- setdiff(samples, names(frag_vec))
  
  if (length(missing) > 0) {
    stop(
      "Missing fragment mapping for: ",
      paste(missing, collapse = ", ")
    )
  }
  
  missing_files <- frag_vec[samples][!file.exists(frag_vec[samples])]
  
  if (length(missing_files) > 0) {
    stop(
      "Missing files:\n",
      paste(missing_files, collapse = "\n")
    )
  }
  
  frag_list <- lapply(samples, function(s) {
    
    cells <- colnames(seurat_obj)[sample_ids == s]
    
    CreateFragmentObject(
      path = frag_vec[s],
      cells = cells
    )
    
  })
  
  seurat_obj[[assay]]@fragments <- frag_list
  
  return(seurat_obj)
}