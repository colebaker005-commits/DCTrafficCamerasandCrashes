#!/bin/bash
# run_pipeline.sh — run the full analysis end-to-end.
# Usage:  bash run_pipeline.sh
set -e    # stop on first error

cd "$(dirname "$0")"

echo "=== 01: Clean crash data ==="
python3 scripts/01_clean_crashes.py
echo

echo "=== 02: Filter eligible cameras ==="
python3 scripts/02_filter_cameras.py
echo

echo "=== 03: Run DiD analysis ==="
python3 scripts/03_run_analysis.py
echo

echo "=== 04: Build Excel workbook ==="
python3 scripts/04_build_workbook.py
echo

echo "=== Pipeline complete ==="
echo "Outputs in: outputs/"
