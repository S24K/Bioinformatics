library(DiffBind)

# Load sample data from CSV
samples <- read.csv("/cluster/home/t134491uhn/DiffBind/samples1.csv", header=TRUE)

# Create DiffBind DBA object
dbaObj <- dba(sampleSheet=samples)

print("Dba count:")
# Count reads in the specified peaks
dbaObj <- dba.count(dbaObj, bUseSummarizeOverlaps=TRUE)

print("Saving")
# Save
dba.save(dbObj, file=‘Diffbind_Trial1, dir='/cluster/projects/epigenomics/Souren', pre='dba_', ext='RData',
         bRemoveAnalysis=FALSE, bRemoveBackground=FALSE,
         bCompress=FALSE)

print("Dba contrast:")
# Define contrast for analysis (primary vs metastasis)
dbaObj <- dba.contrast(dbaObj, categories=DBA_CONDITION, minMembers=2)

print("Dba analyze:")
# Perform differential binding analysis using DESeq2
dbaObj <- dba.analyze(dbaObj, method=DBA_ALL_METHODS)

png("/cluster/home/t134491uhn/DiffBind/diffbind_plots_1.png")

# Generate correlation heatmap
dba.plotHeatmap(dbaObj, contrast=1, correlations=TRUE)

# PCA plot to assess clustering
dba.plotPCA(dbaObj, contrast=1, label=DBA_ID)

# MA plot for differential binding results
dba.plotMA(dbaObj, method=DBA_DESEQ2)

# Retrieve and save results for inspection
dbResults <- dba.report(dbaObj, method=DBA_DESEQ2)
write.csv(as.data.frame(dbResults), "DiffBind_DESeq2_results.csv")

# Optional Venn diagram (if comparing more than one condition)
# dba.plotVenn(dbaObj, contrast=1:2)

print("DiffBind analysis completed successfully.")

dev.off()
