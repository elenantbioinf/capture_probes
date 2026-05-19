# Raw BED files

This directory stores the original BED files defining capture target regions, as obtained from public sources such as manufacturer websites, public repositories, or genome browser resources.

Each file should correspond to a capture assay, panel, or kit and should be stored here **without manual modification**.

Files in this directory are **not intended to be used directly for comparative analysis**.  
Standardized and analysis-ready BED files will be stored in:

`data/processed_beds/`

The source, version, genome build, and original download location of each file should be documented in:

`metadata/capture_probes_metadata.tsv`