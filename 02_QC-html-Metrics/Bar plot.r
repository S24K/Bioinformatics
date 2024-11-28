# Load necessary library
library(ggplot2)

# Create a data frame with the metrics
data <- data.frame(
  Samples = c("CSC449N", "POP161", "CSC_522", "POP_074", "POP160", "POP_170"),
  Percent_Mapped_Reads = c(96.4, 97.3, 98.4, 98.6, 99.3, 98.3),
  NRF = c(0.82, 0.86, 0.81, 0.85, 0.89, 0.82),
  PBC1 = c(0.86, 0.88, 0.84, 0.86, 0.89, 0.84),
  PBC2 = c(8.3, 9.38, 6.39, 7.69, 9.3, 6.49),
  Unique_Reads_Percent = c(63.15, 76.01, 68.22, 74.42, 85.61, 63.85),
  Duplicate_Rate = c(33.25, 21.29, 30.18, 24.17, 13.69, 34.45)
)

# Function to create bar plots
create_bar_plot <- function(metric, y_label, fill_color) {
  ggplot(data, aes(x = Samples, y = .data[[metric]])) +
    geom_bar(stat = "identity", fill = fill_color) +
    labs(
      title = paste("Bar Plot for", gsub("_", " ", metric)),
      x = "Samples",
      y = y_label
    ) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
}

# Generate each plot
plot1 <- create_bar_plot("Percent_Mapped_Reads", "Percent Mapped Reads (%)", "steelblue")
plot2 <- create_bar_plot("NRF", "Non-Redundant Fraction (NRF)", "darkorange")
plot3 <- create_bar_plot("PBC1", "PBC1 (PCR Bottleneck Coefficient 1)", "forestgreen")
plot4 <- create_bar_plot("PBC2", "PBC2 (PCR Bottleneck Coefficient 2)", "purple")
plot5 <- create_bar_plot("Unique_Reads_Percent", "Unique Reads (%)", "cyan")
plot6 <- create_bar_plot("Duplicate_Rate", "Duplicate Rate (%)", "red")

# Print all plots to the plotting window
print(plot1)
print(plot2)
print(plot3)
print(plot4)
print(plot5)
print(plot6)
