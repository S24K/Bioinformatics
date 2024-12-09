library(DiffBind)

# Load sample data from CSV
samples <- read.csv("/cluster/home/t134491uhn/DiffBind/samples1.csv", header=TRUE)

# Create DiffBind DBA object
dbaObj <- dba(sampleSheet=samples)

print("Dba count:")

# Count reads in the specified peaks
dbaObj <- dba.count(dbaObj, bUseSummarizeOverlaps=TRUE)

# print("Saving dba object...")

# Save the dba object
# dba.save(
#  dbaObj,
#  file="Diffbind_Trial1",
#  dir="/cluster/projects/epigenomics/Souren",
#  pre="dba_",
#  ext="RData",
#  bRemoveAnalysis=FALSE,
#  bRemoveBackground=FALSE,
#  bCompress=TRUE
# )

print("Dba contrast:")

# Define contrast for analysis (primary vs metastasis)
dbaObj <- dba.contrast(dbaObj, categories=DBA_CONDITION, minMembers=2)

print("Performing differential binding analysis...")

# Perform differential binding analysis using DESeq2 and EdgeR
dbaObj <- dba.analyze(dbaObj, method=DBA_ALL_METHODS)

# Open graphics device to save plots
png("/cluster/home/t134491uhn/DiffBind/diffbind_plots_1.png")

# Generate correlation heatmap
print("Plotting heatmap...")
dba.plotHeatmap(dbaObj, contrast=1, correlations=TRUE)

# PCA plot to assess clustering
print("Plotting PCA...")
dba.plotPCA(dbaObj, contrast=1, label=DBA_ID)

# MA plot for differential binding results
print("Plotting MA plot...")
dba.plotMA(dbaObj, method=DBA_DESEQ2)

# Retrieve and save results for inspection
print("Saving differential binding results...")
dbResults <- dba.report(dbaObj, method=DBA_DESEQ2)
write.csv(
  dbResults,
  file="/cluster/home/t134491uhn/DiffBind/DiffBind_DESeq2_results.csv"
)

# Close graphics device
dev.off()

print("DiffBind analysis completed successfully.")
