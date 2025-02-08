#!/bin/bash
 
# Directories
IDR_DIR="IDR"
MACS3_DIR="MACS3"
OUTPUT_DIR="reproduciblePeaks"

# Scaled IDR threshold for p < 0.05
IDR_THRESHOLD=540

# Create output directory if it doesn't exist
mkdir -p $OUTPUT_DIR

# Iterate over the IDR result files
for IDR_FILE in $IDR_DIR/*.png; do
    # Get the sample name by stripping the path and suffix (e.g., W18HA_0h)
    SAMPLE_NAME=$(basename "$IDR_FILE" | sed 's/.png//')

    # Define corresponding MACS3 narrowPeak files for both replicates
    MACS3_FILE_REP1="$MACS3_DIR/${SAMPLE_NAME}_1_peaks.narrowPeak"
    MACS3_FILE_REP2="$MACS3_DIR/${SAMPLE_NAME}_2_peaks.narrowPeak"

    # Check if both MACS3 files exist
    if [[ ! -e $MACS3_FILE_REP1 ]]; then
        echo "MACS3 file not found for replicate 1 of sample $SAMPLE_NAME: $MACS3_FILE_REP1"
        continue
    fi
    if [[ ! -e $MACS3_FILE_REP2 ]]; then
        echo "MACS3 file not found for replicate 2 of sample $SAMPLE_NAME: $MACS3_FILE_REP2"
        continue
    fi

    # Define output files for reproducible peaks for both replicates
    OUTPUT_FILE_REP1="$OUTPUT_DIR/${SAMPLE_NAME}_1_reproducible_peaks.bed"
    OUTPUT_FILE_REP2="$OUTPUT_DIR/${SAMPLE_NAME}_2_reproducible_peaks.bed"

    # Filter peaks based on scaled IDR threshold for replicate 1
    echo "Processing replicate 1 for sample: $SAMPLE_NAME"
    awk -v threshold=$IDR_THRESHOLD '{if($5 >= threshold) print $0}' "$MACS3_FILE_REP1" > "$OUTPUT_FILE_REP1"
    sort -k1,1 -k2,2n "$OUTPUT_FILE_REP1" -o "$OUTPUT_FILE_REP1"

    # Filter peaks based on scaled IDR threshold for replicate 2
    echo "Processing replicate 2 for sample: $SAMPLE_NAME"
    awk -v threshold=$IDR_THRESHOLD '{if($5 >= threshold) print $0}' "$MACS3_FILE_REP2" > "$OUTPUT_FILE_REP2"
    sort -k1,1 -k2,2n "$OUTPUT_FILE_REP2" -o "$OUTPUT_FILE_REP2"

    echo "Filtered peaks for $SAMPLE_NAME saved to $OUTPUT_DIR"
done

echo "All samples processed. Results saved in $OUTPUT_DIR."