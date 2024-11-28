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
