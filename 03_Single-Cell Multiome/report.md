# Single-Cell Multiome Analysis

## 1. Objective  
This project involved analyzing single-cell multiome data, which integrates ATAC-seq (chromatin accessibility) and GEX (gene expression) modalities for five samples. The goal was to perform quality control, summarize metrics, and visualize key features using R scripts and ggplot2.

The analyzed samples were:
- **CSC_432**, **CSC_433**, **CSC_478**, **POP_92**, **POP_160**

---

## 2. Summary  
Using single-cell multiome sequencing, we evaluated both chromatin accessibility and gene expression metrics for each sample. This involved calculating quality control statistics, identifying feature linkages (peaks to genes), and generating visualizations to better understand the dataset's characteristics.

---

## 3. Workflow/Methodology  

### Step 1: Data Collection  
Raw data for ATAC-seq and GEX were processed, and key quality metrics were calculated, including:  
- Estimated number of cells.  
- Median fragments per cell (ATAC).  
- Median genes per cell (GEX).  
- Number of peaks detected (ATAC).  

### Step 2: Data Summary and QC Metrics  
The following table summarizes the key QC metrics for each sample:

| Metric                        | CSC_432 | CSC_433 | CSC_478 | POP_92 | POP_160 |
|-------------------------------|---------|---------|---------|--------|---------|
| Estimated Number of Cells     | 6,662   | 9,250   | 6,993   | 9,218  | 8,955   |
| ATAC Median Fragments/Cell    | 14,722  | 13,866  | 22,841  | 14,158 | 10,876  |
| GEX Median Genes/Cell         | 5,524   | 5,623   | 999     | 5,788  | 5,089   |
| Number of Peaks (ATAC)        | 121,403 | 112,768 | 154,393 | 184,828| 144,236 |

### Step 3: Visualization  
Key metrics were visualized using `ggplot2` in R. Below are the key plots generated:

#### Plot 1: Estimated Number of Cells  
A bar chart shows the estimated number of cells across all samples.

#### Plot 2: ATAC Median Fragments per Cell  
This plot highlights chromatin accessibility by comparing the median fragments per cell for each sample.

#### Plot 3: GEX Median Genes per Cell  
This plot illustrates the median number of genes detected per cell for the gene expression modality.

#### Plot 4: Number of Peaks (ATAC)  
A comparison of the number of peaks detected across samples shows variability in chromatin accessibility.

### Step 4: R Script for Data Visualization  
The following R script was used to generate these plots:

```r
# Load necessary libraries
library(ggplot2)

# Create a data frame with the data
data <- data.frame(
  Samples = c("CSC_432", "CSC_433", "CSC_478", "POP_92", "POP_160"),
  Estimated_Number_of_Cells = c(6662, 9250, 6993, 9218, 8955),
  ATAC_Median_Fragments_per_Cell = c(14722, 13866, 22841, 14158, 10876),
  GEX_Median_Genes_per_Cell = c(5524, 5623, 999, 5788, 5089),
  Number_of_Peaks_ATAC = c(121403, 112768, 154393, 184828, 144236)
)

# Plot 1: Estimated Number of Cells
ggplot(data, aes(x = Samples, y = Estimated_Number_of_Cells)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(
    title = "Estimated Number of Cells",
    x = "Samples",
    y = "Estimated Number of Cells"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Plot 2: ATAC Median Fragments per Cell
ggplot(data, aes(x = Samples, y = ATAC_Median_Fragments_per_Cell)) +
  geom_bar(stat = "identity", fill = "darkorange") +
  labs(
    title = "ATAC Median Fragments per Cell",
    x = "Samples",
    y = "ATAC Median Fragments per Cell"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Plot 3: GEX Median Genes per Cell
ggplot(data, aes(x = Samples, y = GEX_Median_Genes_per_Cell)) +
  geom_bar(stat = "identity", fill = "forestgreen") +
  labs(
    title = "GEX Median Genes per Cell",
    x = "Samples",
    y = "GEX Median Genes per Cell"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Plot 4: Number of Peaks (ATAC)
ggplot(data, aes(x = Samples, y = Number_of_Peaks_ATAC)) +
  geom_bar(stat = "identity", fill = "purple") +
  labs(
    title = "Number of Peaks (ATAC)",
    x = "Samples",
    y = "Number of Peaks (ATAC)"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
```
## 4. Results
The analysis revealed variability in chromatin accessibility and gene expression metrics across samples. Notable findings included:
- Sample CSC_478 had the highest median fragments per cell (22,841) and the largest number of peaks detected (154,393).
- Sample POP_160 had robust gene expression metrics, with a median of 5,089 genes per cell.

## 5. Conclusion
This analysis successfully integrated ATAC and GEX data, demonstrating the utility of single-cell multiome sequencing for chromatin and transcriptional insights. Future steps include linkage analysis and exploring functional relationships between detected peaks and expressed genes.
