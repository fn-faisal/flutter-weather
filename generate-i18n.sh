#!/bin/bash

# Directory containing language subdirectories with arb files
BASE_DIR="./lib/locale"

# Loop through each subdirectory within BASE_DIR
for dir in "$BASE_DIR"/*/; do
    # Check if the directory contains a .arb file
    if [ -n "$(find "$dir" -maxdepth 1 -name '*.arb' -print -quit)" ]; then
        for arb_file in "$dir"*.arb; do
            # Extract the base name of the arb file without extension (e.g., 'errors' from 'errors.arb')
            base_name=$(basename "$arb_file" .arb)
            
            # Capitalize the first letter of the base name for the class name (e.g., 'Errors' from 'errors')
            class_name=$(echo "$base_name" | awk '{print toupper(substr($0,1,1)) substr($0,2)}')

            # Construct the output file name (e.g., 'errors_locales.dart')
            output_file="${base_name}_locales.dart"

            echo "Generating localization for $base_name from $arb_file"

            flutter gen-l10n \
                --arb-dir "$dir" \
                --template-arb-file "$(basename "$arb_file")" \
                --output-localization-file "$output_file" \
                --output-class "${class_name}Locales" \
                || { echo "Error generating app l10n for $base_name"; exit 1; }
        done
    else
        echo "No .arb files found in $dir, skipping..."
    fi
done

echo "Localization generation complete."
