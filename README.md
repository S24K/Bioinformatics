# Bioinformatics Co-op Term Summary  

This repository documents my achievements and progress during my bioinformatics co-op term. It highlights the tools, pipelines, and analyses I worked on, focusing on **ATAC-Seq**, **Single-Cell Multiome** data processing, **DiffBind Analysis**, and **Quality Control (QC)** evaluations.  

---

## Key Projects  

### 1. **ATAC-Seq Data Processing**  
- **Objective**: Analyze chromatin accessibility using ENCODE's ATAC-Seq pipeline.  
- **Highlights**:  
  - Configured `.json` files for six samples (`CSC449N`, `CSC_522`, `POP_074`, `POP160`, `POP_170`) to define input FASTQs and analysis parameters.  
  - Submitted jobs via `.sh` scripts to execute ENCODE workflows.  
  - Visualized outputs to interpret differential chromatin accessibility and generate meaningful biological insights.  

### 2. **Quality Control (QC)**  
- **Objective**: Ensure sequencing data meets high-quality standards.  
- **Highlights**:  
  - Generated QC HTML reports to evaluate metrics such as **mapped reads**, **duplicate rate**, **library complexity**, and **signal-to-noise ratios**.  
  - Assessed metrics like **FRiP**, **TSS enrichment**, and **mitochondrial DNA content** for validation.  
  - Visualized key data quality metrics with R scripts.  

### 3. **Single-Cell Multiome Analysis**  
- **Objective**: Process and analyze single-cell multiome data (ATAC + GEX).  
- **Highlights**:  
  - Analyzed metrics like **cell count**, **ATAC/GEX fragment counts**, and **peak number** for five samples (`CSC_432`, `CSC_433`, `CSC_478`, `POP_92`, `POP_160`).  
  - Created custom R scripts to generate bar plots for key metrics and explore dataset quality.  

### 4. **DiffBind Analysis**  
- **Objective**: Identify differential binding sites between transcription factors **Nanog** and **Pou5f1**.  
- **Highlights**:  
  - Configured a sample CSV file listing BAM files, peak files, replicates, and metadata.  
  - Used the **DiffBind R package** to perform:  
    - **Sample Clustering**: PCA plots to visualize sample relationships.  
    - **Correlation Heatmaps**: Assessing replicate consistency.  
    - **Differential Analysis**: Performed using DESeq2 and edgeR pipelines.  
    - **Visualizations**: MA plots, Venn diagrams, and boxplots to showcase enriched regions.  
  - Achieved memory optimization by running R scripts on a high-performance cluster with a 33GB memory requirement.  

---

## Repository Structure  

- `data/`: Contains input files, FASTQ metadata, and results for different experiments.  
- `scripts/`: Includes R and shell scripts used for data processing and analysis.  
- `results/`: Output files, including QC reports and processed data visualizations.  
- `report.md`: Detailed project documentation with methodologies, visualizations, and results.  

---

## Tools & Techniques  

- **Languages**: R, Shell Scripting, Markdown  
- **Tools**: ENCODE ATAC-Seq Pipeline, DiffBind, MultiQC, ggplot2  
- **Platforms**: High-performance cluster computing, GitHub  

---

## Acknowledgments  

I am grateful to the University Health Network (UHN), my co-op supervisor Elias Orouji, and Bioinformatician Amin Noorani for providing guidance and resources throughout this term.

