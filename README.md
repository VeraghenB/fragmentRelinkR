# fragmentRelinkR

This repository provides a reproducible pipeline to attach multi-sample
ATAC-seq fragment files to a Seurat/Signac object.

## Requirements
- Seurat
- Signac
- R >= 4.1

## Usage

```r
source("R/attach_fragments.R")
source("R/validate_fragments.R")

MouseDRG_ATAC <- readRDS("MouseDRG_ATAC.rds")

MouseDRG_ATAC <- attach_fragments(MouseDRG_ATAC, frag_map)
