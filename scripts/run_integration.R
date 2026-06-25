library(Seurat)
library(Signac)

source("../R/attach_fragments.R")
source("../R/validate_fragments.R")
source("../config/frag_map.R")

obj <- readRDS("ATAC_object.rds")

validate_fragments(frag_map, obj)

obj <- attach_fragments(
  obj,
  frag_map
)

CoveragePlot(
  obj,
  region = "Ntrk1"
)