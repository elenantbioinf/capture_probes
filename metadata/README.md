# Metadata

This directory stores structured metadata describing the capture probe target region files included in the project.

## Main metadata table

The main table will be:

`capture_probes_metadata.tsv`

This file will document, for each capture panel or assay:

- Panel identifier
- Manufacturer or source
- Kit name
- Version
- Capture strategy or assay type
- Reference genome build
- Source URL
- Raw BED file path
- Processed BED file path
- Additional notes relevant for reproducibility

The metadata table provides traceability between:

1. The biological or commercial capture design
2. The public source from which the BED file was obtained
3. The raw file stored in the repository
4. The processed file used in downstream analyses

Maintaining accurate metadata is essential to keep the repository transparent, reproducible, and easy to extend.