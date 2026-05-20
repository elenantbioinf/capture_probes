#!/usr/bin/env bash

set -euo pipefail

METADATA="metadata/capture_probes_metadata.tsv"

echo "Downloading raw BED files for capture probes stored in ${METADATA}..."

tail -n +2 "${METADATA}" | while IFS=$'\t' read -r \
    probe_set_id \
    vendor \
    kit_name \
    version \
    assay_type \
    genome_build \
    target_file_description \
    source_url \
    download_url \
    raw_bed \
    processed_bed

do
    #Check that raw bed exists
    if [[ -f "${raw_bed}" ]]; then
        echo "[STOP] Raw BED file already exists for ${probe_set_id} at ${raw_bed}"
        echo "[STOP] Skipping download."
        continue
    fi

    #Define the uncompressed raw bed file path
    uncompressed_raw_bed="${raw_bed%.gz}"

    #Create directory for raw bed file if it doesn't exist
    mkdir -p "$(dirname "${raw_bed}")"

    #Download raw bed file
    echo "[INFO] Downloading raw BED file for ${probe_set_id} from:"
    echo "[INFO] ${download_url}..."

    wget -O "${uncompressed_raw_bed}" "${download_url}"

    #Compress the raw bed file
    echo "[INFO] Compressing raw BED file for ${probe_set_id}..."
    bgzip "${uncompressed_raw_bed}"

    #Info message
    echo "[FINISHED] Downloaded and compressed raw BED file for: ${probe_set_id}"
    echo "[FINISHED] Saved compressed file at:"
    echo "${raw_bed}"
    echo "---------------------------------------------"
done

