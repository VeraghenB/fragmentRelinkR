# fragmentRelinkR

Utilities for repairing, validating, and reattaching fragment files in Signac scATAC-seq objects.

## Why?

Signac stores file paths to fragment files rather than embedding fragments inside Seurat objects.

When a Seurat object is transferred between computers, collaborators often encounter:

* Fragment file not found
* Fragment file is not indexed
* CoveragePlot failures
* Broken fragment paths

fragmentRelinkR provides a reproducible framework for validating and restoring fragment-file links.

## Example

```r
obj <- readRDS("ATAC_object.rds")

validate_fragments(obj, frag_map)

obj <- attach_fragments(
  obj,
  frag_map,
  sample_column = "Sample_name"
)

CoveragePlot(
  obj,
  region = "Ntrk1"
)
```
