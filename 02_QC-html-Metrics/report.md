# Quality Control (QC) Analysis: HTML Reports

## Overview
Quality Control (QC) analysis is an essential step to ensure the reliability and accuracy of sequencing data. The QC HTML reports generated for the six samples (`CSC449N`, `POP161`, `CSC_522`, `POP_074`, `POP160`, `POP_170`) include comprehensive metrics and visualizations to evaluate sequencing quality, library preparation, and experimental consistency.
The QC process focuses on key metrics such as read alignment, library complexity, duplication rates, and signal-to-noise ratio. These metrics help assess the performance of the sequencing experiment and identify potential areas for improvement.

## Key Metrics Explained

### 1. Mapped Reads (%)
- Definition: The percentage of total reads that successfully mapped to the reference genome.
- Relevance: Indicates alignment efficiency; a high percentage suggests good sequencing and mapping quality.
### 2. NRF (Non-Redundant Fraction)
- Definition: The ratio of unique reads to the total number of reads.
- Relevance: Reflects library complexity, with higher values indicating better diversity and reduced redundancy.
### 3. PBC1 (PCR Bottlenecking Coefficient 1)
- Definition: The ratio of distinct reads to the total number of reads.
- Relevance: Helps detect PCR amplification bias, with values closer to 1 indicating minimal bias.
### 4. PBC2 (PCR Bottlenecking Coefficient 2)
- Definition: The ratio of distinct reads to duplicate reads.
- Relevance: Provides additional insights into library complexity and duplication levels.
### 5. Unique Reads (%)
- Definition: The proportion of reads that are unique (not duplicates).
- Relevance: Measures the effective utilization of sequencing reads.
### 6. Duplicate Rate (%)
- Definition: The percentage of reads that are duplicates.
- Relevance: Indicates the level of duplication in the sequencing data; lower values are preferable.
### 7. Fraction of Reads in Peaks (FRiP)
- Definition: The fraction of total reads that overlap identified peaks.
- Relevance: Reflects the enrichment of signal over background noise; higher values indicate better signal specificity.
### 8. TSS Enrichment
- Definition: A measure of the signal-to-noise ratio around transcription start sites (TSS).
- Relevance: High values indicate strong enrichment of accessible chromatin regions.
### 9. Library Complexity
- Definition: Assessed using metrics like NRF, PBC1, and PBC2.
- Relevance: Indicates the diversity of the sequencing library.
### 10. Peak Number
- Definition: Total number of peaks identified in the data.
- Relevance: Higher numbers suggest broader coverage of open chromatin regions or transcription factor binding sites.
### 11. Mitochondrial DNA Content
- Definition: Proportion of reads mapping to mitochondrial DNA.
- Relevance: High values may indicate mitochondrial contamination or cell stress.

## Visualizations and Insights
The HTML QC report includes various graphs and plots to represent these metrics visually. Key visualizations include:
- Insert Size Distribution: Displays the distribution of fragment lengths. Sharp peaks often indicate well-prepared libraries.
- Alignment Summary: Bar charts showing the percentage of mapped, uniquely mapped, and duplicate reads.
- FRiP and TSS Enrichment: Scatter or bar plots for assessing signal-to-noise quality.
- Duplication Metrics: Graphs highlighting duplication rates and library complexity.
- Peak Coverage: Tracks the distribution and overlap of reads within peaks.
- Quality Score Distribution: Visualizes the base call accuracy across all reads.
Each metric is evaluated against expected thresholds or benchmarks to ensure the sequencing experiment meets quality standards. The insights gained from these reports guide troubleshooting and optimization for future experiments.

## Conclusion
The QC HTML reports are indispensable for interpreting the quality and reliability of sequencing data. By analyzing the detailed metrics and graphs, we ensure that the data meets the standards necessary for accurate downstream analyses. This thorough QC evaluation strengthens confidence in the experimental results and the biological conclusions drawn.
